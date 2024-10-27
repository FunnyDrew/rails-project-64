class Posts::LikesController < ApplicationController
	def create
		
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
		@post = Post.find(params[:id])

		@post_like = PostLike.where(post:params[:id], user: current_user)
		#debugger
		@post_like.destroy_all
		redirect_to @post
	end

	private

end
