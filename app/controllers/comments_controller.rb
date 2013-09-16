class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @pattern = Pattern.find(params[:pattern_id])
  end
end