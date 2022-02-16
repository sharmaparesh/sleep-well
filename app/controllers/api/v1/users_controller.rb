class Api::V1::UsersController < ApplicationController
  before_action :validate_user, only: %w(follow)
  before_action :validate_following, only: %w(follow)

  def follow
    fl = @user.followers.new
    fl.follower = current_user

    if fl.save
      render json: fl
      return
    end

    render_response_error(:unsaved)
  end

  private

  def validate_user
    @user = User.find_by(id: params[:user_id]) if params[:user_id]
    return if @user && @user.id != current_user.id

    render_response_error(:user_not_found)
  end

  def validate_following
    return unless @user.followers.with_follower(current_user.id).exists?

    render_response_error(:already_followed)
  end
end
