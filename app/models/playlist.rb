class Playlist < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 
    validates :title, :description, presence: {scope: [:title, :description], message: "already exists, try a different one." }
  
    scope :alpha, -> {order(title: :ASC)}
  


end
 