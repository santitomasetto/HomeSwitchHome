class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :birthdate, :password, :card_number, :card_security_number, :card_vto, :premium, :admin])
			devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :birthdate, :password, :current_password, :card_number, :card_security_number, :card_vto, :premium, :admin])
		end
end
