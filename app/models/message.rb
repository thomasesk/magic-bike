class Message < ApplicationRecord
  belongs_to :booking
  validates :content, length: {minimum: 10}
end
