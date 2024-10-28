# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    @post = resource_post
    # debugger

    @comment = if post_comment_params[:parent_id]

                 resource_post
                   .comments
                   .children_of(post_comment_params[:parent_id])
                   .build(post_comment_params)
               else
                 resource_post.comments.build(post_comment_params)
               end

    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, status: :unprocessable_entity, notice: 'Comment not created'
    end
  end

  private

  def post_comment_params
    # debugger
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
