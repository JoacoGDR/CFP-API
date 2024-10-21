# == Schema Information
#
# Table name: companies
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  business_group_id :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Company < ApplicationRecord
  has_many :vessels, dependent: :nullify
  has_many :catches, through: :vessels
  has_many :catch_quotas, through: :vessels
  belongs_to :business_group, optional: true
  has_many :company_ownership_changes, dependent: :delete_all
  has_many :vessel_acquisitions, class_name: 'VesselOwnershipChange', inverse_of: :new_owner, dependent: :delete_all
  has_many :vessel_disposals, class_name: 'VesselOwnershipChange', inverse_of: :previous_owner, dependent: :delete_all
end
