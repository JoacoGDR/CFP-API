class CreateConsumers < ActiveRecord::Migration[7.2]
  def change
    create_table :consumers do |t|
      t.string :name, null: false
      t.string :api_key, null: false
      t.string :api_secret, null: false
      t.timestamp :last_nonce

      t.index :name, unique: true
      t.timestamps
    end

    add_index :consumers, :api_key, unique: true
  end
end
