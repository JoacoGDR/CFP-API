class CreateVesselOwnershipChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :vessel_ownership_changes do |t|
      t.references :vessel, foreign_key: true, null: false
      t.references :previous_owner, null: false, foreign_key: { to_table: :companies }
      t.references :new_owner, null: false, foreign_key: { to_table: :companies }
      t.date :change_date, null: false
      t.timestamps
    end
  end
end
