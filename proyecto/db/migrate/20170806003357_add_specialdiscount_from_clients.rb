class AddSpecialdiscountFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :specialDiscount, :integer
  end
end
