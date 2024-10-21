RSpec.describe BusinessGroup, type: :model do
  let(:business_group) { described_class.new }

  it { expect(business_group).to have_many(:companies).dependent(:nullify) }
  it { expect(business_group).to have_many(:vessels).through(:companies) }

  it {
    expect(business_group).to have_many(:company_acquisitions)
      .class_name('CompanyOwnershipChange').inverse_of(:new_owner).dependent(:delete_all)
  }

  it {
    expect(business_group).to have_many(:company_disposals)
      .class_name('CompanyOwnershipChange').inverse_of(:previous_owner).dependent(:delete_all)
  }
end
