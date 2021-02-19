class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :new, :edit, :create, :update, :destroy]
    before_action :authorized_to_edit, only: [:edit, :update, :destroy]
    
    def index
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @reviews = @playlist.reviews
        else 
            @reviews = current_user.reviews
        end
    end

    def show
    end

    def new
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id]) 
            @review = @playlist.reviews.build
 
        else
            @review = Review.new
           
        end
    end

    def create 
        if params[:playlist_id] 
            @playlist = Playlist.find_by_id(params[:playlist_id])
        
            @review = @playlist.reviews.build(review_params)
        
            @review.user = current_user
        else
            @review = current_user.reviews.build(review_params)
        end
        if @review.save
            redirect_to review_path(@review)
        else
            flash[:message]= "Invalid Submission."
            render :new 
        end
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit
        end
    end

    def destroy 
            @review.destroy
            flash[:message] = "Successful Delete!"
            redirect_to '/'
    end

    private
        def review_params
            params.require(:review).permit(:rating, :comment, :playlist_id)
        end

        def set_review
            @review = Review.find_by_id(params[:id])
        end

        def authorized_to_edit
        
            if current_user != @review.user
                flash[:message] = "Unauthorized Action!"
                redirect_to '/'
            end
        end
end
