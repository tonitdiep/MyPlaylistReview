class ReviewsController < ApplicationController
    def index
        #check if it is nested
     
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            #ok it is nested, so #&& not comparing for equality but setting it's value
            #  and evauluate is @playlist nil or something ?
            @reveiws = @playlist.reviews 
            # load  # all reviews apart of the playlists
        else
            @error = "Nonexistence" if params[:playlist_id]
            @reviews = Review.all
        end

        # if params[:playlist_id]
        #     @playlist = Playlist.find_by_id(params[:playlist_id])
        #     if @playlist
        #          @review = @playlist.reviews 
        #     else
        #         @error = "Nonexistence"
        #         @reviews = Review.all 
        #     end
        # else
        #     @reviews = Review.all
        # end
    end



    def new
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @review = @playlist.reviews.build 
        else
            @error = "Nonexistence" if params[:playlist_id]
            @review = Review.new
        end
    end

    def create 
        
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @review = Review.find_by(params[:id])
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
            params.require(:review).permit(:raiting, :comment, :playlist_id)
        end
end
