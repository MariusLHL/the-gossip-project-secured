class LikeController < ApplicationController
  def create
    puts "test" 
    Like.create(user_id: current_user.id, 
                content: Gossip.find(params[:gossip_id]),
                content_id: Gossip.find(params[:gossip_id]).id )
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find(params[:id]).delete
    redirect_back(fallback_location: root_path)

  end
end
