# == Schema Information
#
# Table name: vessels
#
#  id                :bigint(8)        not null, primary key
#  registration_code :string           not null
#  name              :string           not null
#  company_id        :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Vessel < ApplicationRecord
  has_many :catches, dependent: :nullify
  belongs_to :company, optional: true
  has_one :business_group, through: :company
  has_many :catch_quotas, as: :owner, dependent: :destroy
  has_many :catch_quota_allocations, as: :owner, dependent: :destroy
  has_many :vessel_ownership_changes, dependent: :delete_all
  has_many :vessel_name_changes, dependent: :delete_all
end
