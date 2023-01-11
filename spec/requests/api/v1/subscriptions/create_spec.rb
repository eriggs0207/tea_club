require 'rails_helper'

RSpec.describe 'Subscriptions API | Create' do
  describe 'Subscription Create' do
    context 'happy path' do
      it 'successfully creates a subscription' do

        customer = create(:customer)
        tea = create(:tea)
        subscription_params = {
          customer_id: customer.id,
          tea_id: tea.id,
          title: "tea club",
          price: 200.00,
          status: 0,
          frequency: 1
        }

        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription: subscription_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response).to have_http_status(201)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:success][:message]).to eq("Subscription has been created")

        expect(customer.subscriptions.count).to eq(1)
      end
    end

    context 'sad path' do
      it 'throws a 401 error if no customer exists' do

        tea = create(:tea)
        subscription_params = {
          customer_id: '',
          tea_id: tea.id,
          title: "tea club",
          price: 200.00,
          status: 0,
          frequency: 1
        }

        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription: subscription_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][0]).to eq("Customer must exist")

      end
      it 'throws a 401 error if no tea exists' do

        customer = create(:customer)
        subscription_params = {
          customer_id: customer.id,
          tea_id: '',
          title: "tea club",
          price: 200.00,
          status: 0,
          frequency: 1
        }

        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription: subscription_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][0]).to eq("Tea must exist")

      end
    end
  end
end
