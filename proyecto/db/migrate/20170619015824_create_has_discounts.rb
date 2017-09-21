class CreateHasDiscounts < ActiveRecord::Migration
  def change
    create_table :has_discounts do |t|
      t.references :client, index: true, foreign_key: true
      t.references :discount, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
