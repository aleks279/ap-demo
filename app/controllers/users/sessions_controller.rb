class Users::SessionsController < Devise::SessionsController
  before_action :all_pages
  before_action :all_categories

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  protected

  def after_sign_in_path_for(resource)
    admin_pages_path
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user, User
      admin_login_path
    else
      super
    end
  end

  private

  def all_pages
    @pages = Page.all
  end

  def all_categories
    @categories = PageCategory.all
  end

end
