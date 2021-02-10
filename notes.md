USER
[ ] has many reviews #that they created
[ ] has many playlists #that they created 
[ ] has many :reviewed_playlists, through: :reviews, source: :playlist #that they reviewed

PLAYLIST
[ ] belongs to user #one who create 
[ ] has many reviews
[ ] has many users through reviews #users that have reviewed the playlist

REVIEW
[ ] belongs to playlist
[ ] belongs to user

Generate 
[ ] 3 Models and it's migrations

[ ] Test out objects and associations in "rails c -s"


User  => User(id: integer, username: string, password_digest: string, email: string, created_at: datetime, updated_at: datetime) 

Playlist => Playlist(id: integer, title: string, description: text, user_id: integer, created_at: datetime, updated_at: datetime) 

Review => Review(id: integer, rating: integer, comment: text, user_id: integer, playlist_id: integer, created_at: datetime, updated_at: datetime) 

getting my user to comment on the playlist to make that reviewed_playlist