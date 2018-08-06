class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :habits
  has_many :check_ins, through: :habits

  validates :username, length: { minimum: 2 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :email, presence: true

  def admin?
    role == "admin"
  end
end
