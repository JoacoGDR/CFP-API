# == Schema Information
#
# Table name: transfers
#
#  id              :bigint(8)        not null, primary key
#  source_quota_id :bigint(8)        not null
#  target_quota_id :bigint(8)        not null
#  date            :date             not null
#  detail          :string
#  amount          :float            not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Transfer < ApplicationRecord
  belongs_to :source_quota, class_name: 'CatchQuota',
                            inverse_of: :outbound_transfers
  belongs_to :target_quota, class_name: 'CatchQuota',
                                 inverse_of: :inbound_transfers
end
