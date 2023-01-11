require 'rails_helper'

RSpec.describe 'Subscriptions API | Update' do
  describe 'Subscription Update' do
    context 'happy path' do
      it 'successfully updates a subscription' do

        subscription = create(:subscription)
        subscription_params = { status: 1 }
        headers = {"CONTENT_TYPE" => "application/json"}

        expect(subscription.status).to eq(0)

        patch '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        subscription_alt = Subscription.find(id: subscription.id)

        expect(response).to be_successful
        expect(response).to have_http_status(200)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:success][:message]).to eq("Subscription has been updated")
        expect(subscription_alt.status).to eq(1)
        expect(subscription_alt.status).to_not eq(subscription.status)


      end
    end
  end
end 
