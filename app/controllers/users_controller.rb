# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
   
   # POST /users/signup
   def signup
    @user = User.new(user_params)
    if @user.save
      token = JwtService.encode(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
   # POST /users/login
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JwtService.encode(user_id: @user.id)
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
  
    # GET /users/:id
    def show
      render json: @user
    end
  
    # PATCH/PUT /users/:id
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:id
    def destroy
      @user.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
  