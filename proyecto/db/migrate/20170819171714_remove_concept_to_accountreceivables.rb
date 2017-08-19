class RemoveConceptToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :concept, :string
  end
end
