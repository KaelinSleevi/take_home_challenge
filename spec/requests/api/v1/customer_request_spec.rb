require 'rails_helper'

describe "Customers API" do
  it "sends a customer" do
    customer = FactoryBot.create(:customer)
    subscription = customer.subscriptions.create!(title: 'Tea Musketeers', price: 14.99, status: 0, frequency: 0)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer[:data].count).to eq(3)

    expect(customer[:data]).to have_key(:id)
    expect(customer[:data][:id]).to be_a(Integer)

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

    expect(customer[:data][:attributes]).to have_key(:subscriptions)
    expect(customer[:data][:attributes][:subscriptions]).to be_a(Array)

    customer[:data][:attributes][:subscriptions].each do |sub|
      expect(sub).to have_key(:title)
      expect(sub[:title]).to be_a(String)

      expect(sub).to have_key(:price)
      expect(sub[:price]).to be_a(Float)

      expect(sub).to have_key(:status)
      expect(sub[:status]).to be_a(String)

      expect(sub).to have_key(:frequency)
      expect(sub[:frequency]).to be_a(String)
    end
  end
end