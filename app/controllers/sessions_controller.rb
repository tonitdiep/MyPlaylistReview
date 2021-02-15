class SessionsController < ApplicationController
    def welcome
        
    end

    def new
        
        @user = User.new

    end



    def create #sign up
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Login Failed. Try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
    def omniauth
        user = User.create_from_omniauth(auth)
            if user.save
                session[:user_id] = user.id
                redirect_to new_playlist_path  

            else
    
                flash[:message] = user.errors.full_messages.join(", ")
                redirect_to playlists_path 
            end
    end

private
    def auth
        request.env['omniauth.auth']
    end

end
