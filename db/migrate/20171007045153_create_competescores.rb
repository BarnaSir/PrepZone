class CreateCompetescores < ActiveRecord::Migration[5.1]
  def change
    create_table :competescores do |t|
      t.integer :score
      t.references :user, foreign_key: true
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
