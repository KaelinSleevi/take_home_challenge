class Api::V1::SubscriptionsController < ApplicationController
 def create
  @customer = Customer.find_by(id: params[:customer_id])
  if @customer
   require "pry"; binding.pry
   subscription = @customer.subscriptions.new(sub_params)
   if subscription.save
    render json: SubscriptionSerializer.new(subscription), status: :created
   end
  else
   render json: { error: 'Customer unsuccessfully subscribed' }, status: :bad_request
  end
 end

 def destroy
  subscription = Subscription.find(params[:id])
  subscription.destroy
 end


 private

 def sub_params
  params.permit(:title, :price, :status, :frequency, :customer_id)
 end
end