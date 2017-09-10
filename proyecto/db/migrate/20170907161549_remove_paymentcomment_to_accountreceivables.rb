class RemovePaymentcommentToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :paymentComment, :string
  end
end
