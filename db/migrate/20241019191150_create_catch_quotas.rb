class CreateCatchQuotas < ActiveRecord::Migration[7.2]
  def change
    create_table :catch_quotas do |t|
      t.references :catch_quota_allocation, foreign_key: true
      t.references :owner, polymorphic: true, null: false
      t.references :species, foreign_key: true, null: false
      t.float :quota, null: false
      t.date :start_date, null: false
      t.timestamps
    end
  end
end
