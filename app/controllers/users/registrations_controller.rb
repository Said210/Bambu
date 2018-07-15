# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_registration_code, only: [:new]

  # GET /resource/sign_up
  def new
    if params[:code]
      if not valid_registration_code?
        params.delete(:code)
        redirect_to new_user_registration_path
      else
        super
      end
    else
      super
    end
  end

  # POST /resource
  # def create
  #     super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    added_attrs = [:code, :username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :occupation, :bio]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :occupation, :bio]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def set_registration_code
    @registration_code = RegistrationCode.find_by(code: params[:code])
  end

  def valid_registration_code?
    if @registration_code
      if @registration_code.redeemed?
        flash[:alert] = "This registration code has already been redeemed"
        false
      end
      true
    else
      flash[:notice] = "You need a registration code"
      false
    end

  end

end
