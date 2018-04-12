class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :all_pages
  before_action :all_categories

  layout 'admin/layouts/admin'

  private

  def all_pages
    @pages = Page.all
  end

  def all_categories
    @categories = PageCategory.all
  end
end
