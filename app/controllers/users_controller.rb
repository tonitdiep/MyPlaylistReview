class UsersController < ApplicationController
    
    def index
    
        if params[:playlist_id] && @playlist = Playlist.find_by_id(params[:playlist_id])
            @users = @playlist.reviews  
        end
    end

    def show
        redirect_if_not_logged_in

        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user 
    end

    def new
      @user = User.new  
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end



    private
        def user_params
            params.require(:user).permit(:username, :password, :email)
        end

end