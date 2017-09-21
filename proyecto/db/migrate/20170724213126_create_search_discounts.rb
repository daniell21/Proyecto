class CreateSearchDiscounts < ActiveRecord::Migration
  def change
    create_table :search_discounts do |t|
      t.string :keywords
      t.integer :percentage

      t.timestamps null: false
    end
  end
end
