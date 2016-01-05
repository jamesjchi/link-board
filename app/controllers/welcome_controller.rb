class WelcomeController < ApplicationController

  before_action :is_authenticated?
  
  def index
    @posts = Post.all
  end
end
