class CreateClientMails < ActiveRecord::Migration
  def change
    create_table :client_mails do |t|
      t.string :title
      t.string :body
      t.string :destinatary

      t.timestamps null: false
    end
  end
end
