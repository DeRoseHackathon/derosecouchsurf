class AddPadmaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :padma_id, :string
  end
end
