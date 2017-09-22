class RemoveKeywordsToSearchClient < ActiveRecord::Migration
  def change
    remove_column :search_clients, :keywords, :string
  end
end
