RSpec.describe Sanction, type: :model do
  it { is_expected.to belong_to(:vessel) }
  it { is_expected.to define_enum_for(:type).with_values(warning: 0, fine: 1, suspension: 2, revocation: 3) }
end
