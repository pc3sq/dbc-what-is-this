class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order('created_at DESC')
    @question = Question.new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.find(session[:current_user])
    @question = Question.new(question_params)

    if @question.save
      @user.questions << @question
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new, notice: 'Question failed to create, try again.'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit, notice: 'Question failed to update, try again.'
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:image_path, :title, :caption)
  end

end
