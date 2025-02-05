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
#  end_date                  :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class CatchQuota < ApplicationRecord
  self.table_name = 'catch_quotas'
  belongs_to :owner, polymorphic: true
  belongs_to :catch_quota_allocation, optional: true
  belongs_to :species

  has_many :outbound_transfers, class_name: 'Transfer', foreign_key: 'source_quota_id',
                                dependent: :nullify, inverse_of: :source_quota
  has_many :inbound_transfers, class_name: 'Transfer', foreign_key: 'target_quota_id',
                               dependent: :nullify, inverse_of: :target_quota


  scope :non_expired, -> { where('end_date IS NULL OR end_date >= ?', Date.current) }
  scope :expired, -> { where('end_date < ?', Date.current) }

  def owner_class
    owner_type.constantize
  end

  def is_current?
    end_date.nil? || end_date >= Date.current
  end
end
