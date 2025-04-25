class CreateCompanyOwnershipChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :company_ownership_changes do |t|
      t.references :company, foreign_key: true, null: false
      t.references :previous_owner, null: false, foreign_key: { to_table: :business_groups }
      t.references :new_owner, null: false, foreign_key: { to_table: :business_groups }
      t.date :change_date, null: false
      t.string :detail
      t.timestamps
    end
  end
end
