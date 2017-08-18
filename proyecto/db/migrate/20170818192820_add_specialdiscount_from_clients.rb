class AddSpecialdiscountFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :specialDiscount, :string
  end
end
