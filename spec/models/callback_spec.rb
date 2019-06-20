RSpec.describe Callback, type: :model do
  context 'fields' do
    it { is_expected.to have_db_column(:event).of_type(:integer) }
    it { is_expected.to have_db_column(:timestamp).of_type(:datetime) }
    it { is_expected.to have_db_column(:message_token).of_type(:string) }
    it { is_expected.to have_db_column(:handled).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:data).of_type(:json) }
  end
end
