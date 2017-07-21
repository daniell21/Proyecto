class RemoveFieldLastnameFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :lastname, :string
  end
end
