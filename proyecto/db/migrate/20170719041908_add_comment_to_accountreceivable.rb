class AddCommentToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :comment, :string
  end
end
