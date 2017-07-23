class RemoveCodeFromAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :code, :string
  end
end
