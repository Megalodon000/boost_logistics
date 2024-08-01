class Tracking < ApplicationRecord
  belongs_to :booking

  validates :status, presence: true
  validates :location, presence: true
end
