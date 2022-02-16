class Api::V1::SleepRecordsController < ApplicationController
  before_action :authenticate_user
  before_action :validate_status, only: %w(create)
  before_action :validate_record, only: %w(complete delete)
  before_action :validate_friend, only: %w(friend_records)

  def index
    sleep_records = current_user.sleep_records
                                .page(current_page)
                                .order(created_at: :desc)
    pagination = load_pagination_data(sleep_records)

    render json: ListSleepRecordSerializer.new(
      sleep_records: sleep_records, pagination: pagination
    ).to_json
  end

  def create
    sleep_record = current_user.sleep_records.new
    if sleep_record.save
      render json: sleep_record
      return
    end

    render_response_error(:unsaved)
  end

  def complete
    @sleep_record.complete
    if @sleep_record.save
      render json: @sleep_record
      return
    end

    render_response_error(:unsaved)
  end

  def delete
    if @sleep_record.delete
      render json: @sleep_record
      return
    end

    render_response_error(:undeleted)
  end

  def friend_records
    sleep_records = @user.sleep_records.last_seven_days
    sleep_records = sleep_records.sort_by(&:sleep_length)

    render json: ListSleepRecordSerializer.new(sleep_records: sleep_records).to_json
  end

  private

  def validate_friend
    @user = User.find_by(id: params[:user_id]) if params[:user_id]
    return render_response_error(:user_not_found) if @user.nil?
    return render_response_error(:not_followed_yet) unless current_user.followed?(@user)
  end

  def validate_status
    return unless current_user.asleep?

    render_response_error(:invalid_state)
  end

  def validate_record
    @sleep_record = current_user.sleep_records.find_by(id: params[:id])
    return if @sleep_record && @sleep_record.initialized?

    render_response_error(:record_not_found)
  end

  def current_page
    params[:page].present? ? params[:page].to_i : 1
  end

  def load_pagination_data(resource)
    {
      current_page: current_page, total_page: resource.total_pages
    }
  end
end
