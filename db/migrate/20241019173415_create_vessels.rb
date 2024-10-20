class CreateVessels < ActiveRecord::Migration[7.2]
  def change
    create_table :vessels do |t|
      t.string :registration_code, null: false
      t.string :name, null: false
      t.references :company, foreign_key: true
      t.timestamps

      t.index :registration_code, unique: true
    end
  end
end
