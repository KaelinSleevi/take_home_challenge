class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address

  def self.customer_subs(customer, subscriptions)
    {
    data: {
       id: customer.id,
       type: "customer",
          attributes: {
          first_name: customer.first_name, 
          last_name: customer.last_name, 
          email: customer.email, 
          address: customer.address,
          subscriptions:
          subscriptions.map do |subscription|
            {
              title: subscription.title,
              price: subscription.price,
              status: subscription.status,
              frequency: subscription.frequency
            }
          end
          }
      }
    }
           
  end
end