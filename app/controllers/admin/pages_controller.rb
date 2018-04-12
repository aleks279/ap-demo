class Admin::PagesController < Admin::BaseController
  before_action :find_page, only: [:show, :edit, :update, :destroy]
  
  def index
    @pages = Page.all
  end

  def show; end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to admin_page_path(@page)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @page.update_attributes(page_params)
      redirect_to admin_page_path(@page)
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    
    redirect_to admin_pages_path
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end

end
