class PostsController < ApplicationController

  before_action :is_authenticated?

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params do |p|

      p.user_id = @current_user.id
      p.save
    end
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to root_path

    else
      flash[:danger] = "Invalid Input"
      redirect_to new_post_path
    end
  end

  def update
    t = Post.find params[:id]
    t.update post_params
    redirect_to root_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def destroy
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
