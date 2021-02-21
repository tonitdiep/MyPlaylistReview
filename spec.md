USER
[X] has many reviews #that they created
[X] has many playlists #that they created 
[X] has many :reviewed_playlists, through: :reviews, source: :playlist #that they reviewed

PLAYLIST
[X] belongs to user #one who create 
[X] has many reviews
[X] has many users through reviews #users that have reviewed the playlist

REVIEW
[X] belongs to playlist
[X] belongs to user

Generate 
[X] 3 Models and it's migrations

[X] Test out objects and associations in "rails c -s"


<% if @review.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(@review.errors.count, "error") %> prohibited this review from being saved:</h2>

    <ul>
      <% @review.errors.each do |error| %>
        <li><%= error.full_message %></li>
      <% end %>
    </ul>
  </div>
  <%end %>
[X] Models and table migrations
[X] Test objects in 'rails c -s"
[X] Validations and scopes
[X] Sign Up 
[X] Log In
[X] Log Out
[X] OmniAuth Sign In
[X] OmniAuth gems, dotenv-rails gems, .env file., .env in gitignore
[X] Sign Up, Log In, Log Out Forms
[X] Users, Reviews, Sessions, Playlists Controllers
[X] Refactor View pages and Controllers
[X] Add partials, when necessary
[X] Use helpers and helpers folders, when necessary
[X] Always check and update routes.rb and schema, when feeling lost or checking things

  
User  => User(id: integer, username: string, password_digest: string, email: string, created_at: datetime, updated_at: datetime) 

Playlist => Playlist(id: integer, title: string, description: text, user_id: integer, created_at: datetime, updated_at: datetime) 

Review => Review(id: integer, rating: integer, comment: text, user_id: integer, playlist_id: integer, created_at: datetime, updated_at: datetime) 


Finding my playlist reviews
 Playlist.find(1).reviews

Find that playlist first review entry
Playlist.find(13).reviews.first

Finds all the reviews I made.
User.find(1).reviews

How to find that first playlist?
p = Playlist.find_by_id(1)

How: find that first playlist id's reviews?
Playlist.find(1).reviews


What's the playlist user's username?
p.user.username 
User.find(3).username

how: I want to see all reviews made towards my playlist?
User.find(1).playlists.find(1).reviews
 u.playlists.find(13).user_id
 <!-- => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "a recommendation", user_id: 1, playlist_id: 1, created_at: "2021-02-10 06:4 -->


 