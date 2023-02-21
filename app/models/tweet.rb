class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  scope :order_desc, -> { order(created_at: :desc) }
end
