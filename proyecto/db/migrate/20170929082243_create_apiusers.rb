class CreateApiusers < ActiveRecord::Migration
  def change
    create_table :apiusers do |t|
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
