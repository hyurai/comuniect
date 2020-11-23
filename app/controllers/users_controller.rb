class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @favorite_infomations = current_user.favorites_infomations
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        
    end
end
