class AddProofToAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :proof, :string
  end
end
