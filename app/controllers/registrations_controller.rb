class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name,:studentid, :email, :password, :password_confirmation, :ph, :fos, :gender, :role_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :studentid, :email, :password, :password_confirmation, :ph, :fos, :gender, :role_id, :current_password)
  end

end