class Api::V1::CustomersController < ApplicationController
 def show
  if Customer.exists?
    customer = Customer.find(params[:id])
    subscriptions = customer.subscriptions

    render json: CustomerSerializer.customer_subs(customer, subscriptions)
   else 
    render json: { error: 'Could not find customer' }, status: :bad_request
   end
 end
end