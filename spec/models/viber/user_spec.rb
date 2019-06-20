RSpec.describe Viber::User, type: :model do
  it { expect(described_class).to be < User }

  context 'relations' do
    it do
      is_expected.to belong_to(:account).inverse_of(:users).class_name('Viber::Account')
    end
  end
end
