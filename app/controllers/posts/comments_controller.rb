# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    @comment = resource_post.comments.build(post_comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to resource_post, notice: t('.success_comment')
    else
      redirect_to resource_post, notice: t('blank_comment')
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
