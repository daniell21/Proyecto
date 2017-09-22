class AddSpecialdiscountFromSearchClient < ActiveRecord::Migration
  def change
    add_column :search_clients, :specialDiscount, :decimal, precision: 15, scale: 2
  end
end
