class Api::V1::LinksController < ApiController

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      respond_to do |format|
        format.json { render json: @link, status: 201 }
      end
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find params[:id]
    if @link.update(link_params)
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:id, :title, :url, :read, :user_id)
  end
end
