RSpec.describe Company, type: :model do
  let(:company) { described_class.new }

  it { expect(company).to have_many(:vessels).dependent(:nullify) }
  it { expect(company).to have_many(:vessel_acquisitions).class_name('VesselOwnershipChange').dependent(:delete_all) }
  it { expect(company).to have_many(:vessel_disposals).class_name('VesselOwnershipChange').dependent(:delete_all) }
  it { expect(company).to have_many(:catches).through(:vessels) }
  it { expect(company).to have_many(:catch_quotas).through(:vessels) }
end
