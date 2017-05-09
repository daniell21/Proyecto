class CreateClientmails < ActiveRecord::Migration
  def change
    create_table :clientmails do |t|
      t.string :title
      t.text :body
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
