class CreateClientsDiscounts < ActiveRecord::Migration
  def change
    create_table :clients_discounts do |t|
      t.integer :client_id
      t.integer :discount_id
    end
  end
end
