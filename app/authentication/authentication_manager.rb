class AuthenticationManager
  attr_reader :headers

  def initialize(headers)
    @headers = headers
  end

  def current_consumer
    return nil if @api_key.blank?

    @current_consumer ||= Consumer.find_by(api_key: @api_key)
  end

  def authenticate_request!
    if missing_credentials?
      raise Exceptions::MissingCredentials,
            I18n.t('error.messages.missing_credentials')
    end
    if invalid_key?
      raise Exceptions::InvalidKey,
            I18n.t('error.messages.invalid_credentials')
    end
    if invalid_credentials?
      raise Exceptions::InvalidCredentials,
            I18n.t('error.messages.invalid_credentials')
    end

    current_consumer.update(last_nonce: nonce)
  end

  private

  def invalid_credentials?
    !(current_consumer.present? && valid_nonce? && valid_digest?)
  end

  def key_header
    @key_header ||= headers['X-Api-Key']
  end

  def digest_header
    @digest_header ||= headers['X-Api-Digest']
  end

  def last_nonce
    @last_nonce ||= current_consumer.last_nonce
  end

  def nonce
    @nonce ||= Time.zone.parse(@nonce)
  end

  def missing_credentials?
    key_header.blank? || digest_header.blank?
  end

  def invalid_key?
    @api_key, @nonce = key_header.split(':')
    @api_key.blank? || @nonce.blank?
  end

  def valid_nonce?
    return true unless validate_nonce?
    return valid_newer_nonce? if last_nonce.blank?

    nonce.to_i > last_nonce.to_i && valid_newer_nonce?
  end

  def valid_newer_nonce?
    actual_nonce_age = Time.zone.now.to_i - nonce.to_i
    actual_nonce_age < max_nonce_age && actual_nonce_age >= 0
  end

  def valid_digest?
    ActiveSupport::SecurityUtils.secure_compare(verified_digest.strip, digest_header.strip)
  end

  def verified_digest
    digest_method = OpenSSL::Digest.new('SHA256')
    hash = OpenSSL::HMAC.digest(digest_method, current_consumer.api_secret, key_header)
    Base64.strict_encode64(hash)
  end

  def max_nonce_age
    @max_nonce_age ||= CredentialsHelper.fetch_secret(:max_nonce_age, default: 300)
  end

  def validate_nonce?
    CredentialsHelper.fetch_secret(:validate_nonce, default: true)
  end
end
