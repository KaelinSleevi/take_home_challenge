require 'rails_helper'

describe "Subscriptions API" do
 it "can create a new subscription" do
  customer = FactoryBot.create(:customer)
  teas = FactoryBot.create_list(:tea, 3)

  subscription_params = {
      customer_id: customer.id,
      title: 'Early Grey',
      price: 14.99,
      status: 0,
      frequency: 0
   }
   headers = {"CONTENT_TYPE" => "application/json"}
   post api_v1_subscriptions_path, headers: headers, params: JSON.generate(subscription_params)

   expect(response).to be_successful
   expect(response.status).to eq(201)

   subscription_data = JSON.parse(response.body, symbolize_names: true)

   expect(subscription_data[:data]).to have_key(:id)
   expect(subscription_data[:data][:id]).to be_a(String)

   expect(subscription_data[:data]).to have_key(:type)
   expect(subscription_data[:data][:type]).to be_a(String)

   expect(subscription_data[:data]).to have_key(:attributes)
   expect(subscription_data[:data][:attributes]).to be_a(Hash)

   expect(subscription_data[:data][:attributes]).to have_key(:title)
   expect(subscription_data[:data][:attributes][:title]).to be_a(String)

   expect(subscription_data[:data][:attributes]).to have_key(:price)
   expect(subscription_data[:data][:attributes][:price]).to be_a(Float)

   expect(subscription_data[:data][:attributes]).to have_key(:status)
   expect(subscription_data[:data][:attributes][:status]).to be_a(String)

   expect(subscription_data[:data][:attributes]).to have_key(:frequency)
   expect(subscription_data[:data][:attributes][:frequency]).to be_a(String)
  end

  it "can cancel a subscription" do
  customer = FactoryBot.create(:customer)
  teas = FactoryBot.create_list(:tea, 3)
  subscription = customer.subscriptions.create!(title: 'Tea Musketeers', price: 14.99, status: 0, frequency: 0)
  
  expect(Subscription.count).to eq(1)
  previous_status = Subscription.last.status

  new_subscription_params = { status: 1 }

  headers = {"CONTENT_TYPE" => "application/json"}
  patch "/api/v1/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate({subscription: new_subscription_params})

  new_subscription = Subscription.find_by(id: subscription)

  expect(response).to be_successful
  expect(Subscription.count).to eq(1)
  expect(new_subscription.status).to_not eq(previous_status)
  expect(new_subscription.status).to eq('cancelled')
  end
end