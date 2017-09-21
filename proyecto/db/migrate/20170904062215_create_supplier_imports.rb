class CreateSupplierImports < ActiveRecord::Migration
  def change
    create_table :supplier_imports do |t|

      t.timestamps null: false
    end
  end
end
