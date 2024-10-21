# == Schema Information
#
# Table name: vessel_ownership_changes
#
#  id                :bigint(8)        not null, primary key
#  vessel_id         :bigint(8)        not null
#  previous_owner_id :bigint(8)        not null
#  new_owner_id      :bigint(8)        not null
#  change_date       :date             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class VesselOwnershipChange < ApplicationRecord
  belongs_to :vessel
  belongs_to :new_owner, class_name: 'Company', inverse_of: :vessel_acquisitions
  belongs_to :previous_owner, class_name: 'Company', inverse_of: :vessel_disposals
end
