class AddCategoryToScore < ActiveRecord::Migration[5.1]
  def change
					add_column :scores, :category_id, :integer
  end
end
