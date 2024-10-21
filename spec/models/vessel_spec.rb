RSpec.describe Vessel, type: :model do
  let(:vessel) { described_class.new }

  it { expect(vessel).to have_many(:catches).dependent(:nullify) }
  it { expect(vessel).to have_many(:catch_quotas).dependent(:destroy) }
  it { expect(vessel).to have_many(:catch_quota_allocations).dependent(:destroy) }
  it { expect(vessel).to have_many(:vessel_ownership_changes).dependent(:delete_all) }
  it { expect(vessel).to have_many(:vessel_name_changes).dependent(:delete_all) }
end
