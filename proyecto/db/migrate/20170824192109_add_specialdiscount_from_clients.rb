class AddSpecialdiscountFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :specialDiscount, :decimal, precision: 5, scale: 2
  end
end
