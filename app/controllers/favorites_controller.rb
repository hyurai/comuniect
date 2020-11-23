class FavoritesController < ApplicationController
    def create
         @favorite = Favorite.create(infomation_id: create_params[:infomation_id],user_id: current_user.id)
         Favorite.order("count(infomation_id) desc")
    end
    def destroy
        @favorite = Favorite.find_by(infomation_id: params[:infomation_id],user_id: current_user.id)
        @favorite.destroy
        redirect_to root_path
    end
    private
    def create_params
        params.permit(:infomation_id)
    end
end
