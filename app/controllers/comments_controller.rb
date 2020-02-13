class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :edit, :destroy]


  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(content: params[:content], user_id: current_user.id, gossip_id: @gossip.id)
    if @comment.save 
      redirect_to @gossip
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      redirect_to '/'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.content =  params[:content]
      if @comment.update(content: params[:content], gossip_id: params[:gossip_id], user_id: User.first.id)
        redirect_to "/"
      else
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @gossip
    end
  end
end