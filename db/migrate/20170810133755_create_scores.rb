class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :score_value
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
