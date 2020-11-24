class UsersController < ApplicationController
    def new
    end
    def create
         user = User.create(nickname: super_params[:nickname],like_entertainer: super_params[:like_entertainer])
         logger.debug user.errors.inspect
         byebug
    end
    def show
        @user = User.find(params[:id])
        @favorite_infomations = current_user.favorites_infomations
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        @user.update
        redirect_to
    end
    private
    def super_params
        params.permit(:nickname,:like_entertainer)
    end
end
