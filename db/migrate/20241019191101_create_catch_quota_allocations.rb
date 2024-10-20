class CreateCatchQuotaAllocations < ActiveRecord::Migration[7.2]
  def change
    create_table :catch_quota_allocations do |t|
      t.references :species, foreign_key: true, null: false
      t.references :owner, polymorphic: true, null: false
      t.float :amount, null: false
      t.date :allocation_date, null: false
      t.string :detail
      t.timestamps
    end
  end
end
