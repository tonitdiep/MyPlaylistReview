class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        #check if it is nested
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @reviews = @playlist.reviews
            # @reviews = Review.all
        else 
            @reviews = current_user.reviews
        end
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
        @review = Review.find_by_id(params[:id])
    end

    def new
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @review = @playlist.reviews.build
            #parent primary ID.child(playlist_id) #has_many belongs_to
            # @review = @playlist.build_reviews (belongs_to)
           
        else
            @error = "Nonexistence" if params[:playlist_id]
                # redirect_to '/'
                @review = Review.new
                # @review.build_playlist
        end
    end

    def create 

        if params[:playlist_id] 
            @playlist = Playlist.find_by_id(params[:playlist_id])
        
            @review = @playlist.reviews.build(review_params)
            #info filled 
            @review.user = current_user
        else
            @review = current_user.reviews.build(review_params)
        end
        if @review.save
            redirect_to review_path(@review)
        else
            render :new #saves info when render new #redirect loose all variables
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
            params.require(:review).permit(:rating, :comment, :playlist_id)
        end
end
