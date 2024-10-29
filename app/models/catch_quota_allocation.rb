# == Schema Information
#
# Table name: catch_quota_allocations
#
#  id              :bigint(8)        not null, primary key
#  species_id      :bigint(8)        not null
#  owner_type      :string           not null
#  owner_id        :bigint(8)        not null
#  amount          :float            not null
#  allocation_date :date             not null
#  detail          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CatchQuotaAllocation < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :species

  has_many :catch_quotas, dependent: :destroy
end
