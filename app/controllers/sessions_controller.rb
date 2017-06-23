class SessionsController < ApplicationController
     def index
    end
    
     def create
    user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
            redirect_to '/shoes'
        else flash[:login_errors] = ["aww snap you either forgot your password or you didn't register!"]
            redirect_to '/'
        end
    end
    
    def destroy
        reset_session
        redirect_to '/'
    end
    
    
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
