class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  has_many :messages, dependent: :destroy


  def self.hosted_by(user)
    Booking.all.select {|booking| booking.bike.user == user}
  end
end
