# == Schema Information
#
# Table name: business_groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BusinessGroup < ApplicationRecord
  has_many :companies, dependent: :nullify
  has_many :vessels, through: :companies
  has_many :company_acquisitions, class_name: 'CompanyOwnershipChange',
                                  inverse_of: :new_owner, dependent: :delete_all
  has_many :company_disposals, class_name: 'CompanyOwnershipChange',
                               inverse_of: :previous_owner, dependent: :delete_all
end
