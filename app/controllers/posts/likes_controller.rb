class Posts::LikesController < ApplicationController
	def create
		#debugger
		
		@like = PostLike.new
		@post = Post.find(params[:post_id])

		@like.post = @post


		@like.user = current_user
		if @like.save
			redirect_to @post, notice: 'Post Liked'
		else
			redirect_to @post, status: :unprocessable_entity, notice: 'Have a problem with post like'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@post_like = @post.likes.find_by(user_id: current_user.id)

		@post_like.destroy if @post_like
		
		redirect_to @post
	end

	private

end
