class CreateVesselNameChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :vessel_name_changes do |t|
      t.references :vessel, foreign_key: true, null: false
      t.string :previous_name, null: false
      t.string :new_name, null: false
      t.date :change_date, null: false
      t.timestamps
    end
  end
end
