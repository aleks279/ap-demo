class Users::SessionsController < Devise::SessionsController

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

end
