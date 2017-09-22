class RemoveConceptToAccountpayables < ActiveRecord::Migration
  def change
    remove_column :accountpayables, :concept, :text
  end
end
