class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id

    if request.xhr?
      if comment.save
        render partial: 'comments/show', locals: { comment: comment }, layout: false, status: :created
      else
        render text: '', status: 400
      end
    else
      redirect_to :root
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:entry_id, :body)
  end
end
