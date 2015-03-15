class Offer < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :country, :state, :city, :address
end
