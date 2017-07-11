class CreateSetups < ActiveRecord::Migration
  def change
    create_table :setups do |t|
      t.float :mount

      t.timestamps null: false
    end
  end
end
