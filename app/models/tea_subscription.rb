class TeaSubscription < ApplicationRecord
 belongs_to :tea
 belongs_to :subscription

 validates_presence_of :tea_id
 validates_presence_of :subscription_id
end