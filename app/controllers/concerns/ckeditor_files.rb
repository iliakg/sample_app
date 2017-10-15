module CkeditorFiles
  extend ActiveSupport::Concern

  def index
    send "fetch_#{controller_name}"
  end

  def create
    @attachments = FileItem.new(files_params)
    @attachments.fetch_file_data!
    @attachments.save
    respond_with_asset(@attachments)
  end

  def destroy
    @file_item.destroy
  end

  private
  def fetch_pictures
    scope = FileItem.images.order(created_at: :desc)
    @pictures = pagination(scope)
    respond(@pictures)
  end

  def fetch_attachment_files
    scope = FileItem.order(created_at: :desc)
    @attachments = pagination(scope)
    respond(@attachments)
  end

  def find_asset
    @file_item = FileItem.find(params[:id])
  end

  def pagination(scope)
    Ckeditor::Paginatable.new(scope).page(params[:page])
  end

  def respond(scope)
    respond_to do |format|
      format.html { render layout: scope.first_page? }
    end
  end

  def authorize_resource
    # ckeditor authorize asset
  end

  def files_params
    _params = params.permit(:upload)
    _params[:attached_file] = _params.delete(:upload)
    _params
  end
end
