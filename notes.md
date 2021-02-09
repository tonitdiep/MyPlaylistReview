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
