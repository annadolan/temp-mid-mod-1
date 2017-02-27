class LinksController < ApplicationController
  def index
    # @hot_links = Link.hot
    @link = Link.new
    @links = current_user.links if current_user
  end

  def create
    @link = current_user.links.new(link_params)
    if current_user.links.find_by(url: @link.url)
      flash[:danger] = "The link submitted already exists"
      redirect_to root_path
    elsif @link.save
      flash[:success] = "Your link has saved"
      redirect_to root_path
    else
      flash[:danger] = "The link submitted was invalid"
      redirect_to root_path
    end
  end

  private
    def link_params
      params.require(:link).permit(:id, :url, :title, :read)
    end
end
