# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    @like = resource_post.likes.build(user_id: current_user.id)

    if @like.save
      redirect_to resource_post
    else
      redirect_to resource_post, status: :unprocessable_entity
    end
  end

  def destroy
    @post_like = resource_post.likes.find_by(user_id: current_user.id)

    @post_like&.destroy

    redirect_to resource_post
  end
end
