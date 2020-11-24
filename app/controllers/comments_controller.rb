class CommentsController < ApplicationController
    def create
        comment = Comment.create(text: comments_params[:text],infomation_id: comments_params[:infomation_id],user_id: current_user.id)
        redirect_to "/infomations/#{comment.infomation.id}"
    end
    def show
        @infomation = Answer.find(params[:infomation_id])
        @comment = Comment.find(params[:id])
        @answers = @comment.answers
    end
    def comments_params
        params.permit(:text,:infomation_id)
    end
end
