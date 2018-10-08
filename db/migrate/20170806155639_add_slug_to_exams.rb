class AddSlugToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :slug, :string
    add_index :exams, :slug, unique: true
  end
end
