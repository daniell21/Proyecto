class CreateAccountpayableImports < ActiveRecord::Migration
  def change
    create_table :accountpayable_imports do |t|

      t.timestamps null: false
    end
  end
end
