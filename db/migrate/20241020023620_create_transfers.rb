class CreateTransfers < ActiveRecord::Migration[7.2]
  def change
    create_table :transfers do |t|
      t.references :source_quota, null: false, foreign_key: { to_table: :catch_quotas }
      t.references :destination_quota, null: false, foreign_key: { to_table: :catch_quotas }
      t.float :amount, null: false
      t.timestamps
    end
  end
end
