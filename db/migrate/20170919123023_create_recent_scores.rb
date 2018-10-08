class CreateRecentScores < ActiveRecord::Migration[5.1]
  def change
    create_table :recent_scores do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.integer :temp

      t.timestamps
    end
  end
end
