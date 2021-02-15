class PlaylistsController < ApplicationController
    # before_action set_playlist
    before_action :redirect_if_not_logged_in
    # before_action :authorized_to_edit, only: [:edit, :update]
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
        binding.pry
        @playlist = current_user.playlists.build(playlist_params)
        if @playlist.save
            redirect_to playlists_path(@playlist)
        else
            render :new
        end
    end

    def edit
        @playlist = Playlist.find_by_id(params[:id])
        if current_user != @playlist.user
            #error mssg
            redirect_to playlist_path
        end
    end

    def update
        @playlist = Playlist.find_by_id(params[:id])
        if current_user != @playlist.user
            redirect_to '/'
        else
            @playlist.update(playlist_params)
        end
        
        if @playlist.save
            redirect_to playlists_path(@playlist)
        else
            redirect_to playlist_path(@playlist)
            flash[:message] = "Invalid update, try again."
        end
        
    end

        def destroy
            @playlist = Playlist.find(params[:id])
            if current_user != @playlist.user
                redirect_to '/'
            else
                @playlist.destroy
                redirect_to playlists_path
            end
        end
    private
        def playlist_params
            params.require(:playlist).permit(:title, :description)
        end

        def authorized_to_edit
          
            if current_user != @playlist.user
                #error mssg
                redirect_to playlist_path
            end
        # def set_playlist
        # end
        end

end
