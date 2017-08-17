class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.string :name
      t.float :amount

      t.timestamps null: false
    end
  end
end
