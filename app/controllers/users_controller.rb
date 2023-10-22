class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url, status: :see_other
  end

  def admin_user
    redirect_to(root_url, status: :see_other) unless current_user.admin?
  end
end
