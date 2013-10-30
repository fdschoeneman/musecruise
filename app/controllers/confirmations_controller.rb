class ConfirmationsController < Devise::ConfirmationsController

  before_action :redirect_confirmed_to_rating, only: [:show]

  def show

    @amenities = Amenity.all
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
      new_user_tour_path
    else
      new_session_path(resource_name)
    end
  end

  def redirect_confirmed_to_rating

    if User.find_by(confirmation_token: params[:confirmation_token]).nil?
      redirect_to root_path
    end
  end

private
  
  def confirmation_params
    [:email, :first_name, :last_name, :phone, :password, :password_confirmation]
  end
end