class UsersController < UserApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  skip_before_action :authorize_user!, only: [:finish_signup]
  skip_before_action :ensure_student, only: [:finish_signup]

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] && (email = params[:user][:email])
      # Search in Padma Contacts
      padma_contact = PadmaContact.find_student_by_email(email)
      if padma_contact
        # If a student is found with the social network email skip confirmation entirely
          @user.padma_id = padma_contact['_id']
          @user.email = email
          @user.save
          @confirm_email_message = "Verifica tu casilla de email para confirmar tu cuenta"
      else
        @user.errors.add :base, "No encontramos tu email en el sistema del Metodo DeRose, consulta con tu instructor"
        @show_errors = true
      end
    elsif current_user.unconfirmed_email
      @confirm_email_message = "Verifica tu casilla de email para confirmar tu cuenta"
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end