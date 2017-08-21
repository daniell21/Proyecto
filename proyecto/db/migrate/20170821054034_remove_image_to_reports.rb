class RemoveImageToReports < ActiveRecord::Migration
  def change
    remove_column :reports, :image, :string
  end
end
