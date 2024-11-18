RSpec.describe Species, type: :model do
  let(:species) { described_class.new }

  it { expect(species).to have_many(:catches).dependent(:delete_all) }
  it { expect(species).to have_many(:vessels).through(:catches) }
  it { expect(species).to have_many(:catch_quotas).dependent(:destroy) }
  it { expect(species).to have_many(:catch_quota_allocations).dependent(:destroy) }

  describe '.quotated' do
    let(:species_with_quotas) { create(:species, :with_quotas) }

    before do
      create(:species)
    end

    it 'returns only species with quotas' do
      expect(described_class.quotated).to eq([species_with_quotas])
    end
  end
end
