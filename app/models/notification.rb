class Notification < ApplicationRecord
  scope :order_by_time, ->{order created_at: :desc}
end
