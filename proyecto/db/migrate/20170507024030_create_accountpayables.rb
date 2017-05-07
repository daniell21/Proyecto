class CreateAccountpayables < ActiveRecord::Migration
  def change
    create_table :accountpayables do |t|
      t.string :descripcion
      t.integer :total
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
