class CreatePublicEntities < ActiveRecord::Migration[7.2]
  def change
    create_table :public_entities do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
