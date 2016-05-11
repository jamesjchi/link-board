class CommentsController < ApplicationController
  before_action :is_authenticated?

  def index
    # finds the post in the database based on the params and post id at end of url
    @post = Post.find params[:post_id]
  end

  def new
    # creates an instance variable and sets it to the params and post id at end of url
    @post = Post.find params[:post_id]
    # creates a new comment
    @comment = Comment.new
  end

  def create
    # uses the comment_params method and loops through by setting the post id and user id to their respective identifiers
    Comment.create comment_params do |c|
      c.post_id = params[:post_id]
      c.user_id = @current_user.id
      c.save
    end
    redirect_to post_comments_path(params[:post_id])
  end

  def destroy

  end

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
      if vote.valid?
        flash[:notice] = "Your vote was counted."
      else
        flash[:error] = "You can only vote once."
      end
    redirect_to :back  
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

