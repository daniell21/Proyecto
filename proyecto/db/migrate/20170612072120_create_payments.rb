class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.text :description
      t.string :proof

      t.timestamps null: false
    end
  end
end
