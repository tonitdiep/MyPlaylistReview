class Review < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  validates :rating, presence: true
  validates :comment, presence: true
end
