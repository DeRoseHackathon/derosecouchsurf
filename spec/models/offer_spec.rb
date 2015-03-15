require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "validations" do
    it {should validate_presence_of :country }
    it {should validate_presence_of :state }
    it {should validate_presence_of :city }
    it {should validate_presence_of :address }
    it { should belong_to :user }
  end

  it "should select the country and city of the user if it has one" do
  end


end
