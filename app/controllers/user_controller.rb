class UserController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @city = City.all
    if current_user
      redirect_to '/'
    end
  end
  
  def index
    @user = User.all
  end
  
  def create
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
        puts params[:city]
          puts @user.errors.to_s 
          @user.errors
      end
  end

  def show
      @user = User.find(params[:id])
      @pic = Faker::Avatar.image
  end
end
