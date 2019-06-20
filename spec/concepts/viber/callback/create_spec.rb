RSpec.describe Viber::Callback::Operation::Create do
  let!(:viber_account) { create :viber_account }

  subject { described_class.call(params: params) }

  describe 'Failure' do
    let(:params) do
      {
        event: 'wrong_type',
        timestamp: nil,
        message_token: ['test']
      }
    end

    let(:errors) do
      {
        event: ['must be one of: subscribed'],
        message_token: ['must be a string'],
        timestamp: ['must be filled']
      }
    end

    it 'returns errors' do
      expect { subject }.to not_change(Viber::Callback, :count)
        .and not_change(Viber::User, :count)
      expect(subject).to be_failure
      expect(subject[:dry_contract].validation.errors.to_h).to eq errors
    end
  end

  describe 'Success' do
    let(:params) { ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(file_fixture('callback_data/viber/subscribed.json').read)) }

    it 'creates callback' do
      expect { subject }.to change(viber_account.callbacks.where(handled: true), :count)
        .from(0).to(1)
        .and change(viber_account.users, :count)
        .from(0).to(1)
      expect(subject[:model].data).to eq params.slice(:user)
      expect(subject[:callback_handler]).to eq Viber::User::Operation::Create
      expect(subject[:'handler.result']).to be_success
      expect(subject).to be_success
    end
  end
end
