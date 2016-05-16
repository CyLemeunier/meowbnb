class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.boolean :confirmed
      t.text :cat_review
      t.integer :cat_rating
      t.text :user_review
      t.integer :user_rating
      t.references :cat, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
