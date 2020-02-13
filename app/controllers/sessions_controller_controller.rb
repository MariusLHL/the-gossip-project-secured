class SessionsControllerController < ApplicationController
  include SessionsControllerHelper
 
  def new

  end
  
  def create
    my_user = User.find_by(email: params[:email])

    if my_user != nil && my_user.authenticate(params[:password]) 
      puts "yes"
      session[:user_id] = my_user.id
      puts User.find_by(id: session[:user_id]).first_name
      puts session[:user_id]
      redirect_to '/'
    else
      @error = "Error in password or email"
      render 'sessions_controller/new'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'

  end
end
