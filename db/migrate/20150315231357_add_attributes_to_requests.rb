class AddAttributesToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :offer, index: true
    add_column :requests, :begins_on, :date
    add_column :requests, :ends_on, :date
    add_column :requests, :begins_flexible, :boolean
    add_column :requests, :ends_flexible, :boolean
    add_column :requests, :description, :text
    add_column :requests, :country, :string
    add_column :requests, :state, :string
    add_column :requests, :city, :string
  end
end
