RSpec.describe Viber::User::Operation::Create do
  let(:account) { create :viber_account }
  let!(:callback) { create :viber_callback, account: account }

  subject { described_class.call(params: params, callback: callback) }

  describe 'Failure' do
    let(:params) do
      {
        user: {
          external_id: {}
        }
      }
    end

    let(:errors) do
      {
        api_version: ['must be filled'],
        avatar: ['must be filled'],
        country: ['must be filled'],
        external_id: ['must be filled'],
        language: ['must be filled'],
        name: ['must be filled']
      }
    end

    it 'returns errors' do
      expect { subject }.to(not_change { callback.reload.attributes })
      expect(subject).to be_failure
      expect(subject[:dry_contract].validation.errors.to_h).to eq errors
    end
  end

  describe 'Success' do
    let(:params) { ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(file_fixture('callback_data/viber/subscribed.json').read)) }

    it 'creates callback' do
      expect { subject }.to change { callback.reload.handled }
        .from(false).to(true)
        .and change(account.users, :count)
        .from(0).to(1)
      expect(subject[:model].external_id).to eq params[:user][:id]
      expect(subject[:model].subscribed).to be_truthy
      attributes = %i[name avatar country language]
      expect(subject[:model].slice(*attributes)).to eq(params[:user].slice(*attributes))
      expect(subject).to be_success
    end
  end
end
