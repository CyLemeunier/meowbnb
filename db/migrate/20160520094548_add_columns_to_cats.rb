class AddColumnsToCats < ActiveRecord::Migration
  def change
    add_column :cats, :care_instructions, :text
    add_column :cats, :diet_instructions, :text
    add_column :cats, :booking_rules, :text
    add_column :cats, :intro, :string
  end
end
