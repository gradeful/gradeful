class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :name
      t.decimal :value
      t.integer :maximum
      t.integer :category_id

      t.timestamps
    end

    add_foreign_key :grades, :categories
  end
end
