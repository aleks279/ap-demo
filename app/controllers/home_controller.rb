class HomeController < ApplicationController

  def index
    @pages = Page.all
    @categories = PageCategory.all
  end

end
