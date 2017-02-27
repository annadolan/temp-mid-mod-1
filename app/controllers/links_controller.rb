class LinksController < ApplicationController
  def index
    # @hot_links = Link.hot
    @link = Link.new
    @links = current_user.links if current_user
  end

  # def create
  #   @link = current_user.links.new(link_params)
  #   if current_user.links.find_by(url: @link.url)
  #     flash[:danger] = "The link submitted already exists"
  #     redirect_to root_path
  #   elsif @link.save
  #     flash[:success] = "Your link has saved"
  #     redirect_to root_path
  #   else
  #     flash[:danger] = "The link submitted was invalid"
  #     redirect_to root_path
  #   end
  # end

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
