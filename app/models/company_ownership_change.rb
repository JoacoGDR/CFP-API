# == Schema Information
#
# Table name: company_ownership_changes
#
#  id                :bigint(8)        not null, primary key
#  company_id        :bigint(8)        not null
#  previous_owner_id :bigint(8)        not null
#  new_owner_id      :bigint(8)        not null
#  change_date       :date             not null
#  detail            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class CompanyOwnershipChange < ApplicationRecord
  belongs_to :company
  belongs_to :new_owner, class_name: 'BusinessGroup', inverse_of: :company_acquisitions
  belongs_to :previous_owner, class_name: 'BusinessGroup', inverse_of: :company_disposals
end
