class AddChartToReports < ActiveRecord::Migration
  def change
    add_column :reports, :chart, :string
  end
end
