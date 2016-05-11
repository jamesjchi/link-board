class WelcomeController < ApplicationController

  before_action :is_authenticated?
  
  def index
    @posts = Post.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
