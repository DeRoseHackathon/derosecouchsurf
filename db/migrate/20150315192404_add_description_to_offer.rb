class AddDescriptionToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :description, :text
    change_column :offers, :status, :boolean
  end
end
