RSpec.describe User, type: :model do
  context 'fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:avatar).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:language).of_type(:string) }
    it { is_expected.to have_db_column(:api_version).of_type(:string) }
  end
end
