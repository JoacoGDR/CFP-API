# == Schema Information
#
# Table name: maximum_allowed_catches
#
#  id         :bigint(8)        not null, primary key
#  detail     :string           default(""), not null
#  species_id :bigint(8)        not null
#  weight     :float            not null
#  start_date :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MaximumAllowedCatch < ApplicationRecord
  belongs_to :species
end
