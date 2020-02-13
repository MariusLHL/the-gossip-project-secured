class SessionsControllerController < ApplicationController
 
  def new

  end
  
  def create 
    my_user = User.find_by(email: params[:email])

    if my_user != nil && my_user.authenticate(params[:password]) 
      puts "yes"
      session[:user_id] = my_user.id
      puts User.find_by(id: session[:user_id]).first_name
      puts session[:user_id]
    else
      render :new
      puts "no"
    end
  end

  def destroy
    session.destroy
  end
end
