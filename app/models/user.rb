class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :venue_users
  has_many :venues, through: :venue_users
  has_many :reviews
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def owned_venues
    Venues.where(owner: self)
  end

  protected
    def password_required?
      confirmed? ? super : false
    end
    
end
