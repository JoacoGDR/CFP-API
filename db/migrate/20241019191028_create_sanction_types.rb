class CreateSanctionTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :sanction_types do |t|
      t.string :name, null: false
      t.json :config
      t.timestamps
    end
  end
end
