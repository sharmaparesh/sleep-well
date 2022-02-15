class Api::V1::SleepRecordsController < ApplicationController
  before_action :authenticate_user
  before_action :validate_status, only: %w(create)
  before_action :validate_record, only: %w(complete)

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

  private

  def validate_status
    return unless current_user.asleep?

    render_response_error(:invalid_state)
  end

  def validate_record
    @sleep_record = current_user.sleep_records.find_by(id: params[:id])
    return if @sleep_record && @sleep_record.initialized?

    render_response_error(:record_not_found)
  end
end
