class PagesController < ApplicationController

  before_action :find_page, only: [:show]
  before_action :all_pages
  before_action :all_categories

  def show; end

  private

  def find_page
    @page = Page.find(params[:id])
  end

  def all_pages
    @pages = Page.all
  end

  def all_categories
    @categories = PageCategory.all
  end
end
