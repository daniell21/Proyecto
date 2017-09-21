class CreateSearchAccountreceivables < ActiveRecord::Migration
  def change
    create_table :search_accountreceivables do |t|
      t.string :keywords
      t.string :paymentType
      t.string :status
      t.string :bank
      t.date :date
      t.boolean :paid
      t.string :month
      t.integer :rate_id

      t.timestamps null: false
    end
  end
end
