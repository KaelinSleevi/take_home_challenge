class Api::V1::SubscriptionsController < ApplicationController
 def create
  @customer = Customer.find_by(id: params[:customer_id])
  if @customer
   subscription = @customer.subscriptions.new(sub_params)
   if subscription.save
    render json: SubscriptionSerializer.new(subscription), status: :created
   end
  else
   render json: { error: 'Customer unsuccessfully subscribed' }, status: :bad_request
  end
 end

 def update
  if Subscription.exists?(params[:id])
  subscription = Subscription.find(params[:id])
   if subscription.update(sub_params)
    subscription.save

    render json: SubscriptionSerializer.new(subscription)
   end
  else
   render json: { error: 'Subscription Not Found' }, status: :bad_request
  end
 end


 private

 def sub_params
  params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id)
 end
end