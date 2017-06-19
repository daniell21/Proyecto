class AddInvoicenumberToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :invoicenumber, :integer
  end
end
