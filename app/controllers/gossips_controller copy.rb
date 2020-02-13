class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :new, :edit, :show]

  def index
    if current_user
      @user = User.find_by(id: session[:user_id]).first_name
    end
    @gossips = Gossip.all
  end

  def show
      id = params[:id].to_i
      @gossip = Gossip.find(id)
      @tag = Gossip.find(id).tag
      @like = @gossip.likes
      @like_id = @like.find_by(user_id: current_user.id)
      @author = User.find(@gossip.user_id)
      @link = @author.id
      @comment = Comment.new
  end

  def new
    @city = City.all
    @goss = Gossip.new
  end

  def create
    @goss = Gossip.new(
                     'title' => params[:title],
                     'content' => params[:content],
                     'user_id' => session[:user_id])
    if @goss.save
      redirect_to @goss
    else
      render 'new'
    end
  end

  def edit
    @goss = Gossip.find(params[:id].to_i)
    if @goss.user_id != current_user.id
      redirect_to '/'
    end
  end

  def update
    len = Gossip.first.id.to_i - 1
    @goss = Gossip.find(params[:id].to_i)
    if @goss.update(title: params[:title], content: params[:content]) 
      redirect_to @goss
    else
      render :show
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user_id
      if @gossip.destroy
        redirect_to "/"
      else
        @error = "Erreur inconnu"
        render :show
      end
    else
      @gossips = Gossip.all
      @error = "Vous ne pouvez pas supprimer ce gossip"
      render :index
    end
  end
end