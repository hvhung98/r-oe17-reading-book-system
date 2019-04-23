class History < ApplicationRecord
  belongs_to :user
  scope :order_by_time, ->{order created_at: :desc}
end
