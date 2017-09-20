class AddCommentFromSuppliers < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :comment, :text
  end
end
