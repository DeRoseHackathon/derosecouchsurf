class OffersController < ApplicationController
  def index
    search_params = []
    if params['offer']
      search_params = offer_params.merge(status: true) 
      search_params = search_params.delete_if {|k,v| v.blank?}
    end
    @countries = Offer.select(:country).distinct.map(&:country)
    @offers = Offer.where(search_params)
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