class LinksController < ApplicationController
  def index
    # @hot_links = Link.hot
    @link = Link.new
    @links = current_user.links.order(created_at: :desc) if current_user
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Your link has updated!"
      redirect_to root_path
    else
      flash.now[:danger] = "Your link did not update. Please make sure you enter a valid URL."
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:id, :url, :title, :read)
    end
end
