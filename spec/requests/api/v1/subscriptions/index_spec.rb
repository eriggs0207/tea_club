require 'rails_helper'

RSpec.describe 'Subscriptions API | Index' do
  describe 'Subscription Index' do
    context 'happy path' do
      it 'successfully shows all subscriptions by customer' do

        customers = create_list(:customer, 2)
        teas = create_list(:tea, 4)
        subscription1 = create(:subscription, tea: teas[0], customer: customers[0], status: 0)
        subscription2 = create(:subscription, tea: teas[1], customer: customers[0], status: 1)
        subscription3 = create(:subscription, tea: teas[3], customer: customers[1], status: 0)
        customer_params = { customer_id: customers[0].id }
        headers = {"CONTENT_TYPE" => "application/json"}

        get "/api/v1/subscriptions", headers: headers, params: customer_params
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(200)

        expect(parsed_response[:data]).to be_an(Array)
        expect(parsed_response[:data].count).to eq(2)
        expect(parsed_response[:data][0]).to have_key(:attributes)
        expect(parsed_response[:data][0]).to have_key(:type)
        expect(parsed_response[:data][0]).to have_key(:id)
        expect(parsed_response[:data][0][:type]).to eq("subscription")
        expect(parsed_response[:data][0][:attributes]).to have_key(:title)
        expect(parsed_response[:data][0][:attributes]).to have_key(:price)
        expect(parsed_response[:data][0][:attributes]).to have_key(:status)
        expect(parsed_response[:data][0][:attributes]).to have_key(:frequency)
        expect(parsed_response[:data][0][:attributes][:status]).to eq("active")
        expect(parsed_response[:data][0][:attributes][:customer_id]).to eq(customers[0].id)
        expect(parsed_response[:data][1][:attributes][:status]).to eq("inactive")
        expect(parsed_response[:data][1][:attributes][:customer_id]).to eq(customers[0].id)
        expect(parsed_response[:data][0][:attributes][:customer_id]).to_not eq(customers[1].id)
        expect(parsed_response[:data][1][:attributes][:customer_id]).to_not eq(customers[1].id)
      end
    end
  end
end
