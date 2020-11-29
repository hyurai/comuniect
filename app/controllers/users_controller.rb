class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @favorite_infomations = current_user.favorites_infomations
    end
    private
end
