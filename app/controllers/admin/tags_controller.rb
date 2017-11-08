class Admin::TagsController < Admin::BaseController

  def index
    @tags = Tag.where('name ILIKE ?', "%#{params[:term]}%")
    render json: @tags, each_serializer: TagSerializer, status: :ok
  end
end
