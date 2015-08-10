class RegistrationsController < Devise::RegistrationsController


def create
  super()
  user = User.last
  if user.created_at > Time.now - 3.seconds
    UserMailer.welcome_email(user, pass=nil).deliver
    beta = user
    # User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Congrats on creating your account. I noticed you haven't set up your profile. The longer you wait, the more clients you're missing out on. Log in, add your information, and upload the best three examples of your work (projects). Once you do, I'll have a chance to review your profile. If you have questions, please contact me and I'll get back to you shortly.", ":)")
  end
end

def after_sign_up_path_for(resource)
  edit_user_registration_path(resource)
end


def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
end

def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update)
end

private

  # def sign_up_params
  #   params.require(:user).permit(:name, :surname, :city, :bio, :avatar, :email, :password, :password_confirmation)
  # end

  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :surname,
      :business_type,
      :service,
      :de_service,
      :company,
      :tax_id,
      :website,
      :phone,
      :city,
      :hourly_rate,
      :bio,
      :status_updates,
      :picture,
      :email,
      :country,
      :password,
      :password_confirmation,
      :current_password)
  end

  def account_update_params
    params.require(:user).permit(
      :first_name,
      :surname,
      :business_type,
      :service,
      :de_service,
      :currently_working_on,
      :status,
      :website,
      :phone,
      :city,
      :hourly_rate,
      :bio,
      :status_updates,
      :picture,
      :email,
      :country,
      :password,
      :password_confirmation,
      :current_password)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
