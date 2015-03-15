class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :zip_code
      t.string :address
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
