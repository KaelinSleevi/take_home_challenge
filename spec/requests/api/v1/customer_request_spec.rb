require 'rails_helper'

describe "Customers API" do
  it "sends a customer" do
    id = FactoryBot.create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer[:data].count).to eq(3)


    expect(customer[:data]).to have_key(:id)
    expect(customer[:data][:id]).to be_a(String)

    expect(customer[:data]).to have_key(:type)
    expect(customer[:data][:type]).to be_a(String)

    expect(customer[:data]).to have_key(:attributes)
    expect(customer[:data][:attributes]).to be_a(Hash)

    expect(customer[:data][:attributes]).to have_key(:first_name)
    expect(customer[:data][:attributes][:first_name]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:last_name)
    expect(customer[:data][:attributes][:last_name]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:email)
    expect(customer[:data][:attributes][:email]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:address)
    expect(customer[:data][:attributes][:address]).to be_a(String)
  end
end