class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
