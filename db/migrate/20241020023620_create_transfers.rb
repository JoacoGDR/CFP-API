class CreateTransfers < ActiveRecord::Migration[7.2]
  def change
    create_table :transfers do |t|
      t.references :source_quota, null: false, foreign_key: { to_table: :catch_quotas }
      t.references :target_quota, null: false, foreign_key: { to_table: :catch_quotas }
      t.date :date, null: false
      t.string :detail
      t.float :amount, null: false
      t.timestamps
    end
  end
end
