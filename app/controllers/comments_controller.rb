class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    response = Response.find(params[:response_id])
    comment = Comment.new(comment_params)

    if comment.save
      response.comment << @comment
      redirect_to @response.question
    else
      render :new
    end
  end

  def edit
  end

  def update
    @comment.update

    redirect_to question_path(@question)
  end

  def destroy
    @comment.destroy

    redirect_to question_path(@question)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
