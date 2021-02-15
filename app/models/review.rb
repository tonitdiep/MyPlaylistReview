class Review < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  validates :ratining, presence: true
  validates :comment, presence: true
end
