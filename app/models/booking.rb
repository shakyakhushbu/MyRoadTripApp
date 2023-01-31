class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  after_create :generate_unique_token
  @booking
  def generate_unique_token
    # byebug
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    @a = (0...8).map{ charset.to_a[rand(charset.size)] }.join
    self.booking_token = @a
    self.save
  end
end
