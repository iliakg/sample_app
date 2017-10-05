class Admin::CategoriesController < Admin::BaseController
  def index
    @categories_json = Category.order('parent_id ASC NULLS FIRST, title ASC').to_json
  end
end
