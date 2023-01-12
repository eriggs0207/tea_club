# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price, float: true

  enum status: %i[active inactive]
  validates :status, inclusion: { in: statuses.keys }
  enum frequency: %i[weekly monthly annually]
  validates :frequency, inclusion: { in: frequencies.keys }
end
