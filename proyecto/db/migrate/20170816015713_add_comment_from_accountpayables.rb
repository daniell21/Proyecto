class AddCommentFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :comment, :text
  end
end
