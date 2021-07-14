class Playlist < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 
    validates :title, :description, presence: {scope: [:title, :description], message: "cannot be blank." }
  
    scope :alpha, -> {order(title: :ASC)}
  
    def self.search(search)
        if search  
            self.where("title LIKE ?", "%#{search}%")
        end
    end
    
end
 