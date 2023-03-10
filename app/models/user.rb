class User < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings
  byebug
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
    byebug
    # @email = self.email
    UserMailer.welcome_email(self).deliver_now
    # UserMailer.with(@email).welcome_email.deliver_now

  end
end
