class User < ApplicationRecord
  validates :full_name, presence: true
  validates :company_name, presence: true
  validates :function, presence: true
  validates :phone, presence: true

  enum role: {customer: 0, admin: 2}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :unapproved, -> { where(approved: false) }

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def admin?
    role == 'admin'
  end

  def customer?
    role == 'customer'
  end
end
