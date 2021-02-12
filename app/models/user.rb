class User < ApplicationRecord
    has_secure_password
    has_many :reviews #that they created
    has_many :playlists #that they crated
    has_many :reviewed_playlists, through: :reviews, source: :playlist #that they reviewed
 
    # def self.create_from_omniauth(auth)
    #     User.find_or_create_by(ui: auth['uid'], provider: auth['provider']) do |u|
    #         u.username =
    #         u.email = 
    #         u.password = 
    # end

end
 
 