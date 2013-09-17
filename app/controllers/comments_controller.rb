class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @pattern = Pattern.find(params[:pattern_id])
    render layout: false
  end

  def index
    @pattern = Pattern.find(params[:pattern_id])
    @comments = @pattern.comments
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])
    comment = Comment.new(params[:comment])
    comment.user = current_user
    comment.pattern = @pattern
    if comment.save
      redirect_to pattern_comments_path(@pattern)
    else
      redirect_to new_pattern_comment_path(@pattern)
    end
  end

  def edit
    @pattern = Pattern.find(params[:pattern_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @pattern = @comment.pattern
    redirect_to pattern_comments_path(@pattern)
  end
end