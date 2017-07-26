class AddClientIdToClientMails < ActiveRecord::Migration
  def change
    add_column :client_mails, :client_id, :integer
  end
end
