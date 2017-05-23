class CreateMailreminders < ActiveRecord::Migration
  def change
    create_table :mailreminders do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
