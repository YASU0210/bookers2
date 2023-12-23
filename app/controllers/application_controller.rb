class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :public_action]
  before_action :configure_permitted_parameters,if: :devise_controller?


  def after_sign_in_path_for(resource)

# ログイン後に遷移させたいパスを返します

flash[:notice] = "Signed in successfully"

user_path(current_user.id)

  end

  private
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
	end
  
end