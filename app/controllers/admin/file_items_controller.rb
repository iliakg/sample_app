class Admin::FileItemsController < Admin::BaseController
  before_action :fetch_file_item, only: [:show, :destroy]

  def index
    @file_items = FileItem.order(created_at: :desc).page(params[:page])
  end

  def create
    @file_item = FileItem.new(files_params)
    @file_item.fetch_file_data!

    if @file_item.save
      render 'file_item_saved'
    else
      render 'file_item_error'
    end
  end

  def destroy
    @file_item.destroy
    redirect_to admin_file_items_path
  end

  private
    def fetch_file_item
      @file_item = FileItem.find(params[:id])
    end

    def files_params
      params.require(:file_item).permit(:attached_file, :remote_attached_file_url)
    end
end