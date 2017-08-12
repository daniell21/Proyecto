class AddOldmonthlypaymentFromConstants < ActiveRecord::Migration
  def change
    add_column :constants, :oldMonthlyPayment, :float
  end
end
