class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

protected
  def after_sign_up_path_for(resource)
    :new_user_tour_path
  end

   def after_inactive_sign_up_path_for(resource)
    session[:previous_url] || root_path
  end
end