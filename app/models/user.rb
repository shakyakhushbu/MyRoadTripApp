class User < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings
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
  # byebug
  # before_create :my_method

  # def my_method
  #  self.skip_confirmation!
  # end     
end
