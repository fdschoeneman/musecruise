class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token]) if params[:confirmation_token].present?
    super if resource.nil? or resource.confirmed?
  end

  def confirm
    self.resource = resource_class.find_by_confirmation_token(params[resource_name][:confirmation_token]) if params[resource_name][:confirmation_token].present?
    if resource.update_attributes(params[resource_name].except(:confirmation_token).permit(confirmation_params)) && resource.password_match?
      self.resource = resource_class.confirm_by_token(params[resource_name][:confirmation_token])
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render :action => "show"
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?
      signed_in_root_path(resource)
    else
      new_session_path(resource_name)
    end
  end

private
  
  def confirmation_params
    [:email, :first_name, :last_name, :phone, :password, :password_confirmation]
  end
end