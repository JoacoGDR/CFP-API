class CreateCatches < ActiveRecord::Migration[7.2]
  def change
    create_table :catches do |t|
      t.boolean :incidental, null: false, default: false
      t.references :vessel, foreign_key: true, null: false
      t.references :species, foreign_key: true, null: false
      t.float :weight, null: false
      t.date :date, null: false
      t.json :location
      t.timestamps
    end
  end
end
