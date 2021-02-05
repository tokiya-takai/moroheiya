class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:first_name,:family_name_kana,:first_name_kana,:birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:profile,:image,:image_delete_message,:black_favorite,:gold_favorite,:purple_favorite,:count_first,:count_secont,:count_third])
  end

  def find_user
    if user_signed_in?
      @current_user = User.find(current_user.id)
    end
  end

end
