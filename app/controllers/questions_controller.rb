class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @question = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
  end

  def update
    @question.update(post_params)
  end

  def destroy
    @question.destroy
  end

  private

  def set_question
      @question = Question.find(params[:id])
  end

  def post_params
    params.require(:question).permit(:title,:caption,:image_path)
  end

end
