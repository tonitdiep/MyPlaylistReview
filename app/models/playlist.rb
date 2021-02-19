class Playlist < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 
    validates :title, :description, presence: {scope: [:title], message: "title already exists, try a different one" }
  
    scope :aplha, -> {order(:title)}
    # scope :first_created, -> {order(created_at: :DESC)}
    # scope :today, lambda { :conditions =>[ "created_at = ? ", Date.today] }
    # scope :today, -> { where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }

    # def self.today
    #     where("created_at >= ?", Time.zone.now.beginning_of_day)
    #   end
end
 