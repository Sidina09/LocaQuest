class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password_digest)
  end
end