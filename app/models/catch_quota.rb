# == Schema Information
#
# Table name: catch_quotas
#
#  id                        :bigint(8)        not null, primary key
#  catch_quota_allocation_id :bigint(8)
#  owner_type                :string           not null
#  owner_id                  :bigint(8)        not null
#  species_id                :bigint(8)        not null
#  quota                     :float            not null
#  start_date                :date             not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class CatchQuota < ApplicationRecord
  self.table_name = 'catch_quotas'
  belongs_to :owner, polymorphic: true

  has_many :outbound_transfers, class_name: 'Transfer', foreign_key: 'source_quota_id',
                                dependent: :nullify, inverse_of: :source_quota
  has_many :inbound_transfers, class_name: 'Transfer', foreign_key: 'destination_quota_id',
                               dependent: :nullify, inverse_of: :destination_quota
end
