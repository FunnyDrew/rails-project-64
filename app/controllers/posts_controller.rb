class PostsController < ApplicationController
	def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to @post, notice: 'Пост создан'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update(post_params)
      redirect_to @post, notice: 'Пост изменен'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find params[:id]

    @post.destroy

    redirect_to posts_url, notice: 'Пост удалён'
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params

    params.require(:post).permit(:title, :body, :category_id)
  end
end
