# == Schema Information
#
# Table name: sanctions
#
#  id          :bigint(8)        not null, primary key
#  vessel_id   :bigint(8)
#  description :string
#  type        :integer          not null
#  date        :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sanction < ApplicationRecord
  belongs_to :vessel
  enum :type, { :warning=> 0, :fine=> 1, :suspension=> 2, :revocation=> 3 }
end
