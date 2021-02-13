class PlaylistsController < ApplicationController

    def index
        @playlists = Playlist.all
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

    private
        def playlist_params
            params.require(:playlist).permit(:title, :description)
        end

end
