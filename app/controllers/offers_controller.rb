class OffersController < ApplicationController
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

  def update
    
  end

  def destroy
    
  end

  def offer_params
    params.require(:offer).permit(:country, :state, :city, :neighborhood, :address, :zip_code)
  end
end