class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.float :monthlyPayment
      t.float :installPayment
      t.float :completePayment
      t.float :reactivationPayment
      t.float :tax

      t.timestamps null: false
    end
  end
end
