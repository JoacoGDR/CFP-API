RSpec.describe VesselNameChange, type: :model do
  let(:vessel_name_change) { described_class.new }

  it { expect(vessel_name_change).to belong_to(:vessel) }
end
