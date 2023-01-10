class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency

  belongs_to :customer
  belongs_to :tea

  enum status: { active: 0, inactive: 1 }
  enum frequency: { weekly: 0, monthly: 1, annually: 2 }
end
