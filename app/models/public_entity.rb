# == Schema Information
#
# Table name: public_entities
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PublicEntity < ApplicationRecord
  has_many :catch_quotas, as: :owner, dependent: :destroy
  has_many :catch_quota_allocations, as: :owner, dependent: :destroy
end
