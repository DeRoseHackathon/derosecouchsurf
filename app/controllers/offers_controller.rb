class OffersController < UserApplicationController
  skip_before_action :ensure_signup_complete, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    
  end

  def show
    
  end

  def new
    @offer = Offer.new(user_id: current_user.id)
  end

  def create
    current_user.offers << Offer.new(offer_params)
    
    if current_user.save
      redirect_to user_path(current_user)
    else
      redirect_to new_offer_path
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(offer_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_offer_path(@offer.id)
    end
  end

  def destroy
    
  end

  def offer_params
    params.require(:offer).permit(:country, :state, :city, :neighborhood, :address, :zip_code, :description, :status)
  end
end