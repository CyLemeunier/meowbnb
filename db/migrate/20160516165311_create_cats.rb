class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :category
      t.string :race
      t.integer :year_of_birth
      t.text :description
      t.integer :rating
      t.integer :price_per_day
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
