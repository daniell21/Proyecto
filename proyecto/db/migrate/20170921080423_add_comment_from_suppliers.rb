class AddCommentFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :comment, :text
  end
end
