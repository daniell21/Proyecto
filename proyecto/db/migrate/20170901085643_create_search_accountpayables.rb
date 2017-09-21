class CreateSearchAccountpayables < ActiveRecord::Migration
  def change
    create_table :search_accountpayables do |t|
      t.string :keywords
      t.date :date
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
