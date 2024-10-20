class CreateConsumers < ActiveRecord::Migration[7.2]
  def change
    create_table :consumers do |t|
      t.string :name, null: false
      t.string :api_key, null: false
      t.string :api_secret, null: false

      t.index :name, unique: true
      t.timestamps
    end
  end
end
