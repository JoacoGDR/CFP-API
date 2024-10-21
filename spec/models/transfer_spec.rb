RSpec.describe Transfer, type: :model do
  let(:transfer) { described_class.new }

  it {
    expect(transfer).to belong_to(:source_quota)
      .class_name('CatchQuota')
      .inverse_of(:outbound_transfers)
  }

  it {
    expect(transfer).to belong_to(:destination_quota)
      .class_name('CatchQuota')
      .inverse_of(:inbound_transfers)
  }
end
