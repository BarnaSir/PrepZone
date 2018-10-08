class RemoveTypeFromCompetition < ActiveRecord::Migration[5.1]
  def change
		remove_column :competitions, :type, :integer
		add_column :competitions, :category_id, :integer
  end
end
