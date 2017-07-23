class AddCompletecountryToClients < ActiveRecord::Migration
  def change
    add_column :clients, :completeCountry, :string
  end
end
