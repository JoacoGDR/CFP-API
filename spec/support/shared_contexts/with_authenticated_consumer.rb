RSpec.shared_context 'with authenticated consumer' do
  let(:consumer) { create(:consumer) }
  let(:nonce) { Time.zone.now.to_i.to_s }
  let(:key_header) { "#{consumer.api_key}:#{nonce}" }
  let(:hash) { OpenSSL::HMAC.digest(OpenSSL::Digest.new('SHA256'), consumer.api_secret, key_header) }
  let(:digest_header) { Base64.encode64(hash) }

  before do
    request.headers['X-Api-Key'] = key_header
    request.headers['X-Api-Digest'] = digest_header
  end
end
