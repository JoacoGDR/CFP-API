RSpec.describe Species, type: :model do
  let(:species) { described_class.new }

  it { expect(species).to have_many(:catches).dependent(:delete_all) }
  it { expect(species).to have_many(:vessels).through(:catches) }
  it { expect(species).to have_many(:catch_quotas).dependent(:destroy) }
  it { expect(species).to have_many(:catch_quota_allocations).dependent(:destroy) }
end
