class UserApplicationController < ApplicationController
  before_action :ensure_signup_complete
  before_action :authenticate_user!
  before_action :ensure_student

  def ensure_student
    if current_user.unconfirmed_email
      @confirm_email_message = "Verifica tu casilla de email para confirmar tu cuenta"
      redirect_to finish_signup_user_path(current_user)
    end
  end
end
