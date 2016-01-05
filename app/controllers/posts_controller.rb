class PostsController < ApplicationController

  before_action :is_authenticated?
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
    redirect_to root_path

    else
      flash[:danger] = "Invalid Input"
      redirect_to '/posts/new'
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
