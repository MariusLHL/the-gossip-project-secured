class UserController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @city = City.all
    if current_user
      redirect_to '/'
    end
    @user = User.new
  end
  
  def index
    
    @user = User.all
  end
  
  def create
    @city = City.all

      @user = User.new(first_name: params[:first_name],
                       last_name: params[:last_name],
                       description: params[:content],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:confirm],
                       age: params[:age],
                       city_id: params[:city])
      if@user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
          @error = @user.errors
          render 'new'
        end
  end

  def show
    @city = City.all

      @user = User.find(params[:id])
      @pic = Faker::Avatar.image
  end
end
