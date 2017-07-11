class RemoveInvoicenumberFromAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :invoicenumber, :integer
  end
end
