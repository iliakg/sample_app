class PagesController < ApplicationController

  def index
    @pages = Page.select(:slug).all
  end

  def show
    @page = Page.find_by(slug: params[:slug])
    raise ActiveRecord::RecordNotFound unless @page.present?
  end
end
