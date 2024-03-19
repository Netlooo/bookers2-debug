class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])

    flash[:notice] = "You have updated user successfully"
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def follow(user_id)
    favorites.create(follow_id: user_id)
  end

  def unfollow(user_id)
    favorites.find_by(follow_id: user_id).destroy
  end
end
