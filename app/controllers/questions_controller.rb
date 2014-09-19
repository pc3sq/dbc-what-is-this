class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Post was successfully created.'
    else
      render :new, notice: 'Post failed to create, try again.'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Post was successfully updated.'
    else
      render :edit, notice: 'Post failed to update, try again.'
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_question
      @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title,:caption,:image_path)
  end

end
