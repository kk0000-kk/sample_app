class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end
end
