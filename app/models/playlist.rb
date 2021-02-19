class Playlist < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 
    validates :title, :description, presence: {scope: [:title], message: "title already exists, try a different one" }
  
    scope :aplha, -> {order(:title)}
    # scope :first_created, -> {order(created_at: :DESC)}
end
 