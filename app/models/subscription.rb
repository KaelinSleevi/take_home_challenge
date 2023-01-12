class Subscription < ApplicationRecord
 belongs_to :customer
 has_many :tea_subscriptions
 has_many :teas, through: :tea_subscriptions

 enum   status: {active: 0, cancelled: 2}
 enum frequency: { montly: 0, "bi_annually" => 1, annually: 3 }

 validates_presence_of :customer_id
 validates_presence_of :title
 validates_presence_of :price
 validates_presence_of :status
 validates_presence_of :frequency
end