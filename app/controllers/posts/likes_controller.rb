class Posts::LikesController < ApplicationController
	def create
		debugger
		
		@post_like = PostLike.new
		@post = Post.find(params[:post_id])

		@post_like.post = @post


		@post_like.user = current_user
		if @post_like.save
			redirect_to @post, notice: 'Post Liked'
		else
			redirect_to @post, status: :unprocessable_entity, notice: 'Have a problem with post like'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@post_like = @post.post_likes.find_by(user_id: current_user.id)
		@post_like.destroy
		redirect_to @post
	end

	private

end
