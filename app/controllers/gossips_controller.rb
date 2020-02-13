class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    if session[:user_id] != nil
      id = params[:id].to_i
      @gossip = Gossip.find(id)
      @tag = Gossip.find(id).tag
      @author = User.find(@gossip.user_id)
      @link = @author.id
      @comment = Comment.new
    else
      @gossips = Gossip.all
      @error = "You must be logged in to see this page"
      render :index
    end
  end

  def new
    @goss = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
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
    if @gossip.destroy
      redirect_to "/"
    else
      render :show
    end
  end
end