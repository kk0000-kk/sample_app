class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
