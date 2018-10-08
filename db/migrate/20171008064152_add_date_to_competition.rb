class AddDateToCompetition < ActiveRecord::Migration[5.1]
  def change
		add_column :competitions, :starting_date, :datetime
  end
end
