# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    @user = User.find_by(confirmation_token: params[:confirmation_token])
    super if @user.nil? || @user.confirmed?
  end

  def confirm
    confirmation_token = params[:user][:confirmation_token]
    @user = User.find_by!(confirmation_token:)

    if @user.update(confirmation_params)
      @user = User.confirm_by_token(confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect :user, @user
    else
      render :show
    end
  end

  private

  def confirmation_params
    params.require(:user).permit(%i[password name])
  end

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

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
