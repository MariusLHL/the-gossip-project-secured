class UserController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
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
                       city_id: City.first.id)
      if@user.save
        session[:user_id] = @user.id
      else  
         @user.errors
      end
  end

  def show
      @user = User.find(params[:id])
      @pic = Faker::Avatar.image
  end
end
