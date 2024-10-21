class CreateSanctions < ActiveRecord::Migration[7.2]
  def change
    create_table :sanctions do |t|
      t.references :vessel, foreign_key: true
      t.string :description
      t.integer :type, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
