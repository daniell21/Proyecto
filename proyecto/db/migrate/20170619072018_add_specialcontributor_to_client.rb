class AddSpecialcontributorToClient < ActiveRecord::Migration
  def change
    add_column :clients, :specialcontributor, :boolean
  end
end
