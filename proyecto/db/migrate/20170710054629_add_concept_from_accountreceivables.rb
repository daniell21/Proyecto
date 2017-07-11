class AddConceptFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :concept, :string
  end
end
