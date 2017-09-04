class CreateAccountreceivableImports < ActiveRecord::Migration
  def change
    create_table :accountreceivable_imports do |t|

      t.timestamps null: false
    end
  end
end
