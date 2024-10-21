RSpec.describe VesselOwnershipChange, type: :model do
  let(:vessel_ownership_change) { described_class.new }

  it { expect(vessel_ownership_change).to belong_to(:vessel) }
  it { expect(vessel_ownership_change).to belong_to(:previous_owner).class_name('Company') }
  it { expect(vessel_ownership_change).to belong_to(:new_owner).class_name('Company') }
end
