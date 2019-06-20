RSpec.describe Viber::Account, type: :model do
  it { expect(described_class).to be < Account }

  context 'relations' do
    it do
      is_expected.to have_many(:callbacks).dependent(:destroy).inverse_of(:account).class_name('Viber::Callback')
    end
    it do
      is_expected.to have_many(:users).dependent(:destroy).inverse_of(:account).class_name('Viber::User')
    end
  end
end
