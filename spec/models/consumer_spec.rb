describe Consumer, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  context 'when creating a consumer' do
    let(:consumer) { described_class.create!(name: 'Test Consumer') }

    it 'sets an API key' do
      expect(consumer.api_key).to be_present
    end

    it 'sets an API secret' do
      expect(consumer.api_secret).to be_present
    end
  end
end
