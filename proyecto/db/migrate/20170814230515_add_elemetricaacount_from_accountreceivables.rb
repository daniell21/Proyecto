class AddElemetricaacountFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :elemetricaAcount, :string
  end
end
