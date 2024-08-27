class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Role-based methods
  def admin?
    role == 'admin'
  end

  def customer?
    role == 'customer'
  end

  def approved?
    approved
  end
end
