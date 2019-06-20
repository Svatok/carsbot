RSpec.describe Account, type: :model do
  context 'enum' do
    it { is_expected.to define_enum_for(:messenger).with_values(viber: 1) }
  end
end
