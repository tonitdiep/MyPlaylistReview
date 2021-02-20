class User < ApplicationRecord
    has_secure_password
    has_many :reviews  #that they created
    has_many :playlists, dependent: :destroy
    has_many :reviewed_playlists, through: :reviews, source: :playlist #that they reviewed
    validates :username, uniqueness: {scope: [:username], message: "already exists. Your Username should be unique." }
    validates :email, uniqueness: true
    # validates :password, length: { minimum: 2 }
    
    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end

    end

end
 
 