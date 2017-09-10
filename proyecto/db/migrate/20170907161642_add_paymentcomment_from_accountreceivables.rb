class AddPaymentcommentFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :paymentComment, :text
  end
end
