class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :offer
	validates :begins_on, presence: true
	validates :ends_on, presence: true
	#TODO: Validate ends_on > begins_on
	validates :country, presence: true
	validates :state, presence: true
	validates :city, presence: true
	validates :description, presence: true
end
