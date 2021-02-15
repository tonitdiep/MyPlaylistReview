class Review < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 10 }
  validates :comment, presence: true
end
