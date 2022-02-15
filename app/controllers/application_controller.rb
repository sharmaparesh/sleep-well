class ApplicationController < ActionController::API
  def authenticate_user
    success = true

    return if success

    render_response_error(:unauthorized)
  end

  def current_user
    @curren_user = User.first
  end

  def render_response_error(error)
    serialize_data = I18n.t(error, scope: %i[api errors])
    render json: ErrorSerializer.new(serialize_data).to_json
  end
end
