module CredentialsHelper
  def self.fetch_secret(key, default: nil)
    Rails.application.credentials.dig(Rails.env.to_sym, key) || default
  end
end
