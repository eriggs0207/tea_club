require 'rails_helper'

RSpec.describe 'Subscriptions API | Update' do
  describe 'Subscription Update' do
    context 'happy path' do
      it 'successfully updates a subscription' do

        sub = create(:subscription)
        subscription_params = { status: 1 }
        headers = {"CONTENT_TYPE" => "application/json"}

        expect(sub.status).to eq("active")

        patch "/api/v1/subscriptions/#{sub.id}", headers: headers, params: JSON.generate(subscription: subscription_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        subscription = Subscription.find_by(id: sub.id)
        expect(response).to be_successful
        expect(response).to have_http_status(200)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:success][:message]).to eq("Subscription has been updated")
        expect(subscription.status).to_not eq("active")
        expect(subscription.status).to eq("inactive")
      end
    end
  end
end
