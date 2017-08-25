class RemoveSpecialdiscountToClients < ActiveRecord::Migration
  def change
    remove_column :clients, :specialDiscount, :float
  end
end
