class VotesController < ApplicationController

  def create
    @vote = Vote.create vote_params do |v|
      v.user_id = @current_user.id
      v.votable_id = params(:posts_id)
      v.votable_type = 
      v.save
    @votes = 
  end

  def upvotes
    @vote = Vote.find(params[:id])
  end

  def downvotes

  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end
