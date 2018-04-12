class Admin::PageCategoriesController < Admin::BaseController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = PageCategory.all
  end

  def show; end

  def new
    @category = PageCategory.new
  end

  def create
    @category = PageCategory.new(category_params)

    if @category.save
      redirect_to admin_page_category_path(@category)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_page_category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_page_categories_path
  end

  private

  def find_category
    @category = PageCategory.find(params[:id])
  end

  def category_params
    params.require(:page_category).permit(:name)
  end
end
