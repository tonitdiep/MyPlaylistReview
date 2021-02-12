class SessionsController < ApplicationController
    def welcome
    end

    def login 

    end

    def logout

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
