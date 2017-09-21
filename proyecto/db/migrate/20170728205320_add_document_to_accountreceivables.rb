class AddDocumentToAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :document, :string
  end
end
