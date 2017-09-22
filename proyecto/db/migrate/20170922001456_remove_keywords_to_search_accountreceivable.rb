class RemoveKeywordsToSearchAccountreceivable < ActiveRecord::Migration
  def change
    remove_column :search_accountreceivables, :keywords, :string
  end
end
