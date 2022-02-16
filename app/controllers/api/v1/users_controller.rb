class Api::V1::UsersController < ApplicationController
  before_action :validate_user, only: %w(follow unfollow)
  before_action :validate_following, only: %w(follow)
  before_action :validate_unfollowing, only: %w(unfollow)

  def follow
    fl = @user.followers.new
    fl.follower = current_user

    if fl.save
      render json: fl
      return
    end

    render_response_error(:unsaved)
  end

  def unfollow
    if @user_follow.delete
      render json: @user_follow
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
    return unless current_user.followed?(@user)

    render_response_error(:already_followed)
  end

  def validate_unfollowing
    @user_follow = @user.followers.with_follower(current_user.id).take
    return if @user_follow

    render_response_error(:not_followed_yet)
  end
end
