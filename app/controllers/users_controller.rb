class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index destroy following followers]
  before_action :admin_user, only: :destroy
  before_action :set_user, only: %i[show destroy]

  def index
    @users = User.page(params[:page])
  end

  def show
    @microposts = @user.microposts.page(params[:page])
  end

  def destroy
    @user.destroy!
    redirect_to users_url, status: :see_other, notice: 'User deleted'
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(root_url, status: :see_other) unless current_user.admin?
  end
end
