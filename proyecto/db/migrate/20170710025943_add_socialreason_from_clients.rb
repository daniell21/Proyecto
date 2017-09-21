class AddSocialreasonFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :socialReason, :text
  end
end
