class AddMassmailingsFromClientMails < ActiveRecord::Migration
  def change
    add_column :client_mails, :massMailings, :boolean
  end
end
