class UsersController < ApplicationController
    skip_before_action :authorize, only: [:new, :create, :index]
      
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id]=user.id
            redirect_to '/shoes'
        else 
            flash[:reg_errors] = user.errors.full_messages
            redirect_to '/'
        end
            
    end
    
    def show
          	@user = User.find(params[:id])
  	@my_shoes = Shoe.where(user_id:params[:id], purchased:false)
  	@sales = Shoe.where(user_id:params[:id], purchased:true)
    @sales_total = Shoe.where(user_id:params[:id], purchased:true).count('amount')
  	@purchases = Purchase.where(user_id:params[:id])
    @purchases_total = Purchase.where(user_id:params[:id]).sum('amount')
  
    end
    
        
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
    end
end
