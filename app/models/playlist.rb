class Playlist < ApplicationRecord
    belongs_to :user #one who create
    has_many :reviews
    has_many :users, through: :reviews #users that have reviewed the playlist
    validates :title, presence: true
    validates :description, presence: true 
end
 