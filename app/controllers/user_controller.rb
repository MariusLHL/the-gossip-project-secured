require 'faker'

class UserController < ApplicationController
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
        puts @user.errors
      end

  end

  def show
    if session[:user_id] != nil
      @user = User.find(params[:id])
      @pic = Faker::Avatar.image
    else
      @user = User.all
      @error = "You must be logged in to see this page"
      render :index
    end 
  end
end
