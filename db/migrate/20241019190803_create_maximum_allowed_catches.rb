class CreateMaximumAllowedCatches < ActiveRecord::Migration[7.2]
  def change
    create_table :maximum_allowed_catches do |t|
      t.string :detail, null: false, default: ''
      t.references :species, foreign_key: true, null: false
      t.float :weight, null: false
      t.date :start_date, null: false
      t.timestamps
    end
  end
end
