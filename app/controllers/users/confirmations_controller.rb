# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # skip_before_action :require_no_authentication
  # skip_before_action :authenticate_user!
  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   @user = User.find_by(confirmation_token: params[:confirmation_token])
  #   super if @user.nil? || @user.confirmed?
  # end

  # def confirm
  #   confirmation_token = params[:user][:confirmation_token]
  #   @user = User.find_by!(confirmation_token:)

  #   if @user.update(confirmation_params)
  #     @user = User.confirm_by_token(confirmation_token)
  #     set_flash_message :notice, :confirmed
  #     sign_in_and_redirect :user, @user
  #   else
  #     render :show
  #   end
  # end

  # private

  # def confirmation_params
  #   params.require(:user).permit(%i[password name])
  # end

  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  # protected

  # def with_unconfirmed_confirmable
  #   @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
  #   if !@confirmable.new_record?
  #     @confirmable.only_if_unconfirmed {yield}
  #   end
  # end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    super
  end
end
