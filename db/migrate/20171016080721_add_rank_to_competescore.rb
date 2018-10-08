class AddRankToCompetescore < ActiveRecord::Migration[5.1]
	def change
		add_column :competescores, :rank, :integer
	end
end
