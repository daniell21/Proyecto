class AddPaymentcommentToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :paymentComment, :string
  end
end
