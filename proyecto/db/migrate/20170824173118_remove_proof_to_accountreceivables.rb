class RemoveProofToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :proof, :string
  end
end
