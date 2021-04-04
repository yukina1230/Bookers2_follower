class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def follower #follower一覧
    user = User.find(params[:user_id])
    @users = user.followings
    # .follower_userメソッド ：Userモデルで定義済
  end

  def followed #followed一覧
    user = User.find(params[:user_id])
    @users = user.followers
    # .follower_userメソッド ：Userモデルで定義済
  end

end
