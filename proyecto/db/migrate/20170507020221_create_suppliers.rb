class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :lastname
      t.string :email

      t.timestamps null: false
    end
  end
end
