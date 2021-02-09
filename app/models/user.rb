class User < ApplicationRecord
    has_many :reviews #that they created
    has_many :playlists #that they crated 
    has_many :reviewed_playlists, through: :reviews, source: :playlist #that they reviewed
end
