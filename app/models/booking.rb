class Booking < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :shipment_date, presence: true
  validates :shipment_type, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :length, numericality: { greater_than_or_equal_to: 0 }
  validates :width, numericality: { greater_than_or_equal_to: 0 }
  validates :height, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
end
