class CreateAccountreceivables < ActiveRecord::Migration
  def change
    create_table :accountreceivables do |t|
      t.references :client, index: true, foreign_key: true
      t.text :descripcion
      t.integer :total

      t.timestamps null: false
    end
  end
end
