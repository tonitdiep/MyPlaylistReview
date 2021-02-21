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

<div>
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
  </div>

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


 Specs:

 Using Ruby on Rails for the project
 Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
 Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
 Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
 Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 Include signup (how e.g. Devise)
 Include login (how e.g. Devise)
 Include logout (how e.g. Devise)
 Include third party signup/login (how e.g. Devise/OmniAuth)
 Include nested resource show or index (URL e.g. users/2/recipes)
 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate