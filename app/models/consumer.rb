# == Schema Information
#
# Table name: consumers
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  api_key    :string           not null
#  api_secret :string           not null
#  last_nonce :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Consumer < ApplicationRecord
  API_KEY_LENGTH = CredentialsHelper.fetch_secret(:consumer_key_length, default: 32)
  API_SECRET_LENGTH = CredentialsHelper.fetch_secret(:consumer_secret_length, default: 64)

  validates :api_key, :api_secret, :name, presence: true
  before_validation :generate_api_codes, on: :create

  private

  def generate_api_codes
    self.api_key = generate_api_key
    self.api_secret = generate_api_secret
  end

  def generate_api_key
    Devise.friendly_token(API_KEY_LENGTH)
  end

  def generate_api_secret
    Devise.friendly_token(API_SECRET_LENGTH)
  end
end
