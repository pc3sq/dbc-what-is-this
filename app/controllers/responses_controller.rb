class ResponsesController < ApplicationController

  before_action :set_response, only: [:edit, :update, :destroy]

  def new
    @response = Response.new
  end

  def create
    question = Question.find(params[:question_id])
    response = Response.new(content: response_params[:content], user_id: session[:current_user])

    if response.save
      question.responses << response
      redirect_to response.question
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @response.update(response_params)
      redirect_to @response.question
    else
      render :edit
    end
  end

  def destroy
    question = @response.question
    @response.destroy

    redirect_to question
  end

  def up_vote
    response = Response.find(params[:id])

  end

  private

  def set_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:content)
  end

end
