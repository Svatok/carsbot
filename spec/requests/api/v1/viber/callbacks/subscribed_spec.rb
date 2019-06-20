require 'rails_helper'

RSpec.describe 'Subscribed', :show_in_doc, type: :request do
  describe 'POST #create' do
    let!(:viber_account) { create :viber_account }

    describe 'Not authentificated' do
      before { post api_v1_viber_callbacks_path }

      it 'returns error' do
        expect(response).to be_unauthorized
      end
    end

    describe 'Authentificated' do
      before do
        expect_any_instance_of(Api::V1::Viber::CallbacksController).to receive(:run)
          .with(Viber::Callback::Operation::Create, params: be_kind_of(Hash))
        authentificate!(:viber)
        post api_v1_viber_callbacks_path, params: params
      end

      context 'failure' do
        let(:params) { {} }

        it 'handles callback' do
          expect(response).to be_ok
          expect(response.body).to be_empty
        end
      end

      context 'success' do
        let(:params) { JSON.parse(file_fixture('callback_data/viber/subscribed.json').read) }

        it 'handles callback' do
          expect(response).to be_ok
          expect(response.body).to be_empty
        end
      end
    end
  end
end
