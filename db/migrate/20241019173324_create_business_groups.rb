class CreateBusinessGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :business_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
