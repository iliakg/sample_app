class Admin::PagesController < Admin::BaseController
  before_action :fetch_page, only: [:edit, :update, :destroy]

  def index
    @pages = Page.order(created_at: :desc)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path
  end

  private
  def fetch_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:slug, :content)
  end
end
