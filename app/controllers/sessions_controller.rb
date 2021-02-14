class SessionsController < ApplicationController
    def welcome
        
    end

    def new
        # byebug
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
# def omniauth
#     def self.create_from_omniauth(auth)
#         User.find_or_create_by(ui: auth['uid'], provider: auth['provider']) do |u|
#             u.username =
#             u.email = 
#             u.password = 
#         end
#         if @user.save
#             session[:user_id] = user.id
#             redirect_to new
#     end
# end

# private
# def auth
#     request.env('omniauth.auth')
# end

end
