class AddPhotoToCats < ActiveRecord::Migration
  def change
    add_column :cats, :photo, :string
  end
end
