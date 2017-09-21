class CreateClientImports < ActiveRecord::Migration
  def change
    create_table :client_imports do |t|

      t.timestamps null: false
    end
  end
end
