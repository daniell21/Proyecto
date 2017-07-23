class RemoveCommentFromAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :comment, :string
  end
end
