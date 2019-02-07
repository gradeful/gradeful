class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :weight
      t.integer :course_id

      t.timestamps
    end

    add_foreign_key :categories, :courses
  end
end
