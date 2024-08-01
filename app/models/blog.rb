class Blog < ApplicationRecord
  has_one_attached :image  # Ensure you have ActiveStorage set up if using attachments
  
  validates :title, presence: true
  validates :publication_date, presence: true
end
