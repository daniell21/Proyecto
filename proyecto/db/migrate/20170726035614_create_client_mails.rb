class CreateClientMails < ActiveRecord::Migration
  def change
    create_table :client_mails do |t|
      t.string :title
      t.string :body
      t.date :date
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
