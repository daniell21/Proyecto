class AddCodeFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :code, :string
  end
end
