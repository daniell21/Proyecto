class CreateSearchSuppliers < ActiveRecord::Migration
  def change
    create_table :search_suppliers do |t|
      t.string :keywords
      t.string :lastname
      t.string :email

      t.timestamps null: false
    end
  end
end
