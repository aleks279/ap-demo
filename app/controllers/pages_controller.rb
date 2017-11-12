class PagesController < InheritedResources::Base

  before_action :find_page, only: [:show]

  def show; end

  private

  def find_page
    @page = Page.find(params[:id])
  end
end
