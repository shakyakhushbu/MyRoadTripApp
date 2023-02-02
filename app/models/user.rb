class User < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings
  after_create :welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end  

  def welcome_email
    UserMailer.welcome_email.deliver_now
  end
end
