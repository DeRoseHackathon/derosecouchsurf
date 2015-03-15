require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:offer) }
  it { should have_db_column(:begins_on) }
  it { should validate_presence_of :begins_on }
  it { should have_db_column(:ends_on) }
  it { should validate_presence_of :ends_on }
  it { should have_db_column(:begins_flexible) }
  it { should have_db_column(:ends_flexible) }
  it { should have_db_column(:description) }
  it { should validate_presence_of :description }
  it { should have_db_column(:country) }
  it { should validate_presence_of :country }
  it { should have_db_column(:state) }
  it { should validate_presence_of :state }
  it { should have_db_column(:city) }
  it { should validate_presence_of :city }
end
