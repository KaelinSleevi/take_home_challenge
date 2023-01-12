class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :status, :price, :frequency
end