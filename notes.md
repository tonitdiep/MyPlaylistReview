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

  
User  => User(id: integer, username: string, password_digest: string, email: string, created_at: datetime, updated_at: datetime) 

Playlist => Playlist(id: integer, title: string, description: text, user_id: integer, created_at: datetime, updated_at: datetime) 

Review => Review(id: integer, rating: integer, comment: text, user_id: integer, playlist_id: integer, created_at: datetime, updated_at: datetime) 

can my user to comment on the playlist to review that reviewed_playlists
Finding my playlist reviews
 Playlist.find(1).reviews
 <!--  Playlist Load (0.1ms)  SELECT "playlists".* FROM "playlists" WHERE "playlists"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  Review Load (0.2ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."playlist_id" = ? /* loading for inspect */ LIMIT ?  [["playlist_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "a recommendation", user_id: 1, playlist_id: 1, created_at: "2021-02-10 06:47:02.415779000 +0000", updated_at: "2021-02-10 06:47:02.415779000 +0000">]> 
2.6.1 :088 >  -->
Finds all the reviews I made.
User.find(1).reviews
  <!-- User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  Review Load (0.2ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "a recommendation", user_id: 1, playlist_id: 1, created_at: "2021-02-10 06:47:02.415779000 +0000", updated_at: "2021-02-10 06:47:02.415779000 +0000">]>  -->
How to find that first playlist?
p = Playlist.find_by_id(1)

How: find that first playlist id's reviews?
Playlist.find(1).reviews
  <!-- Playlist Load (0.1ms)  SELECT "playlists".* FROM "playlists" WHERE "playlists"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  Review Load (0.3ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."playlist_id" = ? /* loading for inspect */ LIMIT ?  [["playlist_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "a recommendation", user_id: 1, playlist_id: 1, created_at: "2021-02-10 06:47:02.415779000 +0000", updated_at: "2021-02-10 06:47:02.415779000 +0000">]> 
2.6.1 :138 >  -->

What's the playlist user's username?
p.user.username 
  <!-- User Load (2.5ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
 => "Yuri"  -->
how: I want to see all reviews made towards my platlist?
User.find(1).playlists.find(1).reviews
 <!-- => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "a recommendation", user_id: 1, playlist_id: 1, created_at: "2021-02-10 06:4 -->


 user1 = User.new(attribute: "", attribute: "", attribute: "")
user2 = User.new(attribute: "", attribute: "", attribute: "")
playlist = user1.playlists.build(attribute: "", attribute: "")
review = user2.reviews.build(attribute: "", attribute: "", playlist_id: playlist.id)

<!-- 2.6.1 :023 > user1
 => #<User id: 1, username: "Dom", password_digest: [FILTERED], email: "dom@test.com", created_at: "2021-02-10 16:53:09.382518000 +0000", updated_at: "2021-02-10 16:53:09.382518000 +0000"> 
2.6.1 :024 > user2
 => #<User id: 2, username: "Marcy", password_digest: [FILTERED], email: "marcy@test.com", created_at: "2021-02-10 16:53:27.158590000 +0000", updated_at: "2021-02-10 16:53:27.158590000 +0000"> 
2.6.1 :025 > playlist
 => #<Playlist id: 1, title: "Dom's Playlist", description: "Always Fun", user_id: 1, created_at: "2021-02-10 16:53:09.540287000 +0000", updated_at: "2021-02-10 16:53:09.540287000 +0000"> 
2.6.1 :026 > review
 => #<Review id: 1, rating: 4, comment: "amazing playlist", user_id: 2, playlist_id: 1, created_at: "2021-02-10 17:01:52.764977000 +0000", updated_at: "2021-02-10 17:01:52.764977000 +0000"> 
2.6.1 :027 > user1.reviewed_playlists
  Playlist Load (1.7ms)  SELECT "playlists".* FROM "playlists" INNER JOIN "reviews" ON "playlists"."id" = "reviews"."playlist_id" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 
2.6.1 :028 > user2.reviewed_playlists
  Playlist Load (0.4ms)  SELECT "playlists".* FROM "playlists" INNER JOIN "reviews" ON "playlists"."id" = "reviews"."playlist_id" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Playlist id: 1, title: "Dom's Playlist", description: "Always Fun", user_id: 1, created_at: "2021-02-10 16:53:09.540287000 +0000", updated_at: "2021-02-10 16:53:09.540287000 +0000">]> 
2.6.1 :029 >  -->

<!-- 2.6.1 :026 > review
 => #<Review id: 1, rating: 4, comment: "amazing playlist", user_id: 2, playlist_id: 1, created_at: "2021-02-10 17:01:52.764977000 +0000", updated_at: "2021-02-10 17:01:52.764977000 +0000"> 
2.6.1 :027 > user1.reviewed_playlists
  Playlist Load (1.7ms)  SELECT "playlists".* FROM "playlists" INNER JOIN "reviews" ON "playlists"."id" = "reviews"."playlist_id" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 
2.6.1 :028 > user2.reviewed_playlists
  Playlist Load (0.4ms)  SELECT "playlists".* FROM "playlists" INNER JOIN "reviews" ON "playlists"."id" = "reviews"."playlist_id" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Playlist id: 1, title: "Dom's Playlist", description: "Always Fun", user_id: 1, created_at: "2021-02-10 16:53:09.540287000 +0000", updated_at: "2021-02-10 16:53:09.540287000 +0000">]> 
2.6.1 :029 > user1.playlists
  Playlist Load (1.7ms)  SELECT "playlists".* FROM "playlists" WHERE "playlists"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Playlist id: 1, title: "Dom's Playlist", description: "Always Fun", user_id: 1, created_at: "2021-02-10 16:53:09.540287000 +0000", updated_at: "2021-02-10 16:53:09.540287000 +0000">]> 
2.6.1 :030 > user2.playlists
  Playlist Load (0.2ms)  SELECT "playlists".* FROM "playlists" WHERE "playlists"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 
2.6.1 :031 > user2.reviews
  Review Load (2.0ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Review id: 1, rating: 4, comment: "amazing playlist", user_id: 2, playlist_id: 1, created_at: "2021-02-10 17:01:52.764977000 +0000", updated_at: "2021-02-10 17:01:52.764977000 +0000">]> 
2.6.1 :032 > user1.reviews
  Review Load (0.2ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 
2.6.1 :033 > review
 => #<Review id: 1, rating: 4, comment: "amazing playlist", user_id: 2, playlist_id: 1, created_at: "2021-02-10 17:01:52.764977000 +0000", updated_at: "2021-02-10 17:01:52.764977000 +0000"> 
2.6.1 :034 >  -->