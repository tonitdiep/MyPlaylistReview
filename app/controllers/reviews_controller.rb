class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        #check if it is nested
        @reviews = Review.all
        # if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
        #     #ok it is nested, so #&& not comparing for equality but setting it's value
        #     #  and evauluate if @playlist nil or something ?
        #     @reveiws = @playlist.reviews 
        #     # load  # all reviews apart of the playlists
        # else
        #     @error = "Nonexistence" if params[:playlist_id]
        #     @reviews = Review.all
        # end

    end

    def show
        @review = Review.find_by(params[:id])
    end

    def new
        if !params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @review = @playlist.reviews.build
            redirect_to playlist_reviews_path(@review)
        else
            @error = "Nonexistence" if !params[:playlist_id]
                # redirect_to '/'
                @review = Review.new
        end
    end

    def create 
        
        @playlist = Playlist.find_by_id(params[:playlist_id])
        @review = @playlist.reviews.build(review_params)
        
        if @review.save
            redirect_to playlist_reviews_path(@review.playlist)
        else
            render :new
        end
    end



    def edit
        @review = Review.find_by(id: params[:id])
    end

    def update
        @review = Review.find_by(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit
        end
    end

    private
        def review_params
            params.require(:review).permit(:rating, :comment, :user_id, :playlist_id)
        end
end
