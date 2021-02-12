class SessionsController < ApplicationController
    def welcome
    end
    def new
    end

    def login 
    end

    def create
        
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            # flash[:massage] = "Login Failed. Try again."
            redirect_to '/'
        end
    end

    # def destroy
    #     session.clear
    #     redirect_to root_path or session#home?
    # end
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
