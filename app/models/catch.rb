# == Schema Information
#
# Table name: catches
#
#  id         :bigint(8)        not null, primary key
#  incidental :boolean          default(FALSE), not null
#  vessel_id  :bigint(8)        not null
#  species_id :bigint(8)        not null
#  weight     :float            not null
#  date       :date             not null
#  location   :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Catch < ApplicationRecord
  belongs_to :vessel
  belongs_to :species
end
