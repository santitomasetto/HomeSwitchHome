# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  #GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     @u=User.new(params.require(:user).permit(:birthdate,:card_vto))
     if Time.now.year-@u.birthdate.year>17
       if (@u.card_vto.month - Time.now.month) + 12 * (@u.card_vto.year - Time.now.year) >0
        super
       else
        flash.alert = "Su tarjeta esta vencida"
        redirect_to new_user_registration_path, alert: "Su tarjeta esta vencida"
       end
     else
        flash.alert = "Tenes que ser mayor de 18 años"
        redirect_to new_user_registration_path
     end
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     session[:user_id] = current_user.id
     @user=User.find(session[:user_id])
     @u =User.new(params.require(:user).permit(:birthdate,:card_vto))
     if Time.now.year-@u.birthdate.year>17
       if (@u.card_vto.month - Time.now.month) + 12 * (@u.card_vto.year - Time.now.year) >0
          if @user.update(params.require(:user).permit(:birthdate,:card_vto))
            super
          end
       else
        flash.alert = "Su tarjeta esta vencida"
        redirect_to edit_user_registration_path, alert: "Su tarjeta esta vencida"
       end
     else
        flash.alert = "Tenes que ser mayor de 18 años"
        redirect_to edit_user_registration_path
     end
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
