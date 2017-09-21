class AddConstantToAccountreceivables < ActiveRecord::Migration
  def change
    add_reference :accountreceivables, :constant, index: true, foreign_key: true
  end
end
