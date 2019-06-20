require 'rails_helper'

RSpec.describe 'Subscribed', :show_in_doc, type: :request do
  describe 'POST #create' do
    let!(:viber_account) { create :viber_account }

    before do
      expect_any_instance_of(Api::V1::Viber::CallbacksController).to receive(:run)
        .with(Viber::Callback::Operation::Create, params: be_kind_of(Hash))
      post api_v1_viber_callbacks_path, params: params
    end

    describe 'Failure' do
      let(:params) { {} }

      it 'handles callback' do
        expect(response).to be_ok
        expect(response.body).to be_empty
      end
    end

    describe 'Success' do
      let(:params) { JSON.parse(file_fixture('callback_data/viber/subscribed.json').read) }

      it 'handles callback' do
        expect(response).to be_ok
        expect(response.body).to be_empty
      end
    end
  end
end
