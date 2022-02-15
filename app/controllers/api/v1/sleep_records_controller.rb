class Api::V1::SleepRecordsController < ApplicationController
  before_action :authenticate_user
  before_action :validate_status, only: %w(create)

  def create
    sleep_record = current_user.sleep_records.new
    if sleep_record.save
      render json: sleep_record
      return
    end

    render_response_error(:unsaved)
  end

  private

  def validate_status
    return unless current_user.asleep?

    render_response_error(:invalid_state)
  end
end
