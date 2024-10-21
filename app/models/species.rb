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
end
