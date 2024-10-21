RSpec.describe PublicEntity, type: :model do
  let(:public_entity) { described_class.new }

  it { expect(public_entity).to have_many(:catch_quotas).dependent(:destroy) }
  it { expect(public_entity).to have_many(:catch_quota_allocations).dependent(:destroy) }
end
