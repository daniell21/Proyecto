class CreateSearchClientPayments < ActiveRecord::Migration
  def change
    create_table :search_client_payments do |t|
      t.integer :keywords

      t.timestamps null: false
    end
  end
end
