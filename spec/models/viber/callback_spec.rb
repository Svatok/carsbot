RSpec.describe Viber::Callback, type: :model do
  it { expect(described_class).to be < Callback }

  context 'relations' do
    it do
      is_expected.to belong_to(:account).inverse_of(:callbacks).class_name('Viber::Account')
    end
  end

  context 'enum' do
    it { is_expected.to define_enum_for(:event).with_values(subscribed: 1) }
  end
end
