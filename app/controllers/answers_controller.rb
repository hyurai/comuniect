class AnswersController < ApplicationController
    def create
        answer = Answer.create(infomation_id: create_params[:infomation_id], comment_id: create_params[:comment_id],text: create_params[:text],user_id: current_user.id ) 
        redirect_to "/infomations/#{answer.infomation_id}/comments/#{answer.comment_id}/"
    end
    private
    def create_params
        params.permit(:infomation_id,:comment_id,:text)
    end
end
