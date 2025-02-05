# == Schema Information
#
# Table name: vessel_name_changes
#
#  id          :bigint(8)        not null, primary key
#  vessel_id   :bigint(8)        not null
#  new_name    :string           not null
#  change_date :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class VesselNameChange < ApplicationRecord
  belongs_to :vessel
end
