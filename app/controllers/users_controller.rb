class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def index
      render json:  User.all.map{|user| {id: user.id,first_name: user.first_name, last_name: user.last_name,age: user.age,email:user.email}}
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: User.all.map{|user| {id: user.id,first_name: user.first_name, last_name: user.last_name,age: user.age,email: user.email }}
      else
        render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      @user = User.find_by(first_name: params[:id])
      if @user
        render json: { id: @user.id, first_name: @user.first_name, last_name: @user.last_name, age: @user.age,email: @user.email }
      else
        render json: { message: "user not found" }
      end
    end
  
    def destroy
      @user = User.find_by(id: params[:id])
      if @user.destroy
        render json: { message:"user deleted"}
      else
        render json: {message:"user not found"}
      end
    end
  
    private
  
      def user_params
        params.require(:user).permit(:first_name,:last_name,:email)
      end
  end