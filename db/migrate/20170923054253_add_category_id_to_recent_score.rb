class AddCategoryIdToRecentScore < ActiveRecord::Migration[5.1]
  def change
		add_column :recent_scores, :category_id, :integer
  end
end
