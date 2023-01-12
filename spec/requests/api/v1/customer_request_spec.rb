require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    FactoryBot.create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(5)

    items[:data].each do |data|
     expect(data).to have_key(:id)
     expect(data[:id]).to be_a(String)

     expect(data).to have_key(:type)
     expect(data[:type]).to be_a(String)

     expect(data).to have_key(:attributes)
     expect(data[:attributes]).to be_a(Hash)

     expect(data[:attributes]).to have_key(:first_name)
     expect(data[:attributes][:first_name]).to be_a(String)

     expect(data[:attributes]).to have_key(:last_name)
     expect(data[:attributes][:last_name]).to be_a(String)

     expect(data[:attributes]).to have_key(:email)
     expect(data[:attributes][:email]).to be_a(String)

     expect(data[:attributes]).to have_key(:address)
     expect(data[:attributes][:address]).to be_a(String)
    end
  end
end