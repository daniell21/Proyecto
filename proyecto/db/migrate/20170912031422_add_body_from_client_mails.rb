class AddBodyFromClientMails < ActiveRecord::Migration
  def change
    add_column :client_mails, :body, :text
  end
end
