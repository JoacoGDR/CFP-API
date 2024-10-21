RSpec.describe Catch, type: :model do
  it { is_expected.to belong_to(:species) }
  it { is_expected.to belong_to(:vessel) }
end
