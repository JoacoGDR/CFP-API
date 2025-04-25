RSpec.describe CatchQuota, type: :model do
  let(:catch_quota) { described_class.new }

  it { expect(catch_quota).to belong_to(:owner) }

  it {
    expect(catch_quota).to have_many(:outbound_transfers)
      .class_name('Transfer')
      .with_foreign_key('source_quota_id')
      .dependent(:nullify).inverse_of(:source_quota)
  }

  it {
    expect(catch_quota).to have_many(:inbound_transfers)
      .class_name('Transfer')
      .with_foreign_key('target_quota_id')
      .dependent(:nullify).inverse_of(:target_quota)
  }
end
