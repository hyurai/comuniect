class UsersController < ApplicationController
    def new
    end
    def create
        User.create(nickname: super_params[:nickname],like_entertainer: super_params[:like_entertainer],user_id: current_user.id)
         logger.debug user.errors.inspect
         redirect_to '/infomations'
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
