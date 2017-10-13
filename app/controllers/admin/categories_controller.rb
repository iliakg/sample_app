class Admin::CategoriesController < Admin::BaseController
  before_action :fetch_category, only: [:edit, :update, :destroy]
  before_action :fetch_parent_category, only: [:new, :create]

  def index
    @categories_json = Category.order('parent_id ASC NULLS FIRST, title ASC').to_json
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.parent_id = @parent_category.id if @parent_category.present?

    if @category.save
      render 'success_created'
    else
      render 'errors'
    end
  end

  def update
    if @category.update(category_params)
      render 'success_updated'
    else
      render 'errors'
    end
  end

  def destroy
    @category.destroy
  end

  private
  def fetch_category
    @category = Category.find(params[:id])
  end

  def fetch_parent_category
    @parent_category = Category.find(params[:parent_category_id]) if params[:parent_category_id].present?
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
