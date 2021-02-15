class PlaylistsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        
        # @playlists = Playlist.all
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @playlist = @user.playlists
        else
            # redirect_to '/'
            @playlists = Playlist.all
            # @playlist = Playlist.ordered_by_price.less_pricey(80)
        end 
    end

    def show
    
        @playlist = Playlist.find(params[:id])
   
    end

    def new
        @playlist = Playlist.new
    end

    def create 
        
        @playlist = current_user.playlists.build(playlist_params)
        if @playlist.save
            redirect_to playlists_path(@playlist)
        else
            render :new
        end
    end

    def edit
    end

    # def update
    # end

    def destroy
    
    end
    private
        def playlist_params
            params.require(:playlist).permit(:title, :description)
        end

end
