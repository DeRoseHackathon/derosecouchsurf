class CitiesController < ApplicationController
  def index
    response = Offer.where("country = ? AND state = ? AND lower(state) like ?", params[:country], params[:state], "%#{params[:q].try(:downcase)}%").map{|s| {"id" => s.city, "text" => s.city}}
    response = response.uniq

    respond_to do |format|
      if response
        format.json { render :json => { :collection => response }.as_json }
      else
        format.json { render json: nil, status: :unprocessable_entity }
      end
    end
  end
end