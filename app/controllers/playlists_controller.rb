class PlaylistsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_playlist, only: [:show, :edit, :update]
    before_action :authorized_to_edit, only: [:edit, :update]
    def index
   
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @playlist = @user.playlists.alpha
        else
            @playlists = Playlist.alpha
            
        end 
    end

    def show
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

    def update

           if @playlist.update(playlist_params)
                redirect_to playlist_path(@playlist)
                flash[:message]= "Awesome!"
        end

    end

    def destroy
        @playlist = Playlist.find_by_id(params[:id]) 

        if current_user !=  @playlist.user 
            flash[:message] = "Unauthorized action."
            redirect_to playlists_path
        else
            @playlist.destroy
            redirect_to '/'
        end 
    end
    
    private
        def playlist_params
            params.require(:playlist).permit(:title, :description)
        end

        def authorized_to_edit 
            if current_user != @playlist.user
                flash[:message] = "Unauthorized action."
                redirect_to '/'
            end
        end
        
        def set_playlist
            @playlist = Playlist.find_by_id(params[:id]) 
        end
    

end
