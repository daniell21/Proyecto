class CreateSearchClients < ActiveRecord::Migration
  def change
    create_table :search_clients do |t|
      t.string :keywords
      t.integer :rif
      t.string :profitCode
      t.string :email
      t.string :specialcontributor
      t.string :state
      t.string :socialReason
      t.string :discounts
      t.string :country

      t.timestamps null: false
    end
  end
end
