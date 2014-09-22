class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order('created_at DESC')
    @question = Question.new
    @user = User.new

  end

  def show
    @response = Response.new
    @comment = Comment.new
    if session[:current_user]
      @user = @question.user
    else
      @user = User.new
    end
  end

  def create
    @user = User.find(session[:current_user])
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        @user.questions << @question
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.js { render json: @question }
      else
        @error = { notice: 'Question failed to create, try again.'}
        format.html { render :index, notice: 'Question failed to create, try again.' }
        format.js { render json: @error }
      end
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
    params.require(:question).permit(:image_path, :title)
  end

end
