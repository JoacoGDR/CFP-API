# == Schema Information
#
# Table name: species
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Species < ApplicationRecord
  has_many :catches, dependent: :delete_all
  has_many :vessels, through: :catches
  has_many :catch_quotas, dependent: :destroy
  has_many :catch_quota_allocations, dependent: :destroy
  has_many :maximum_allowed_catches, dependent: :destroy

  scope :quotated, -> { where(id: CatchQuota.select(:species_id).distinct) }
  scope :unquotated, -> { where.not(id: CatchQuota.select(:species_id).distinct) }

  scope :by_quotated_status, lambda { |status|
    case status
    when true
      quotated
    when false
      unquotated
    else
      all
    end
  }
end
