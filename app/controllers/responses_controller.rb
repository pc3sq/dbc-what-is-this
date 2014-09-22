class ResponsesController < ApplicationController

  before_action :set_response, only: [:edit, :update, :destroy, :up_vote, :mark_as_best]

  def create
    question = Question.find(params[:question_id])
    response = Response.new(content: response_params[:content], user_id: session[:current_user])

    if response.save
      question.responses << response
      redirect_to response.question
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

    vote = Vote.new( response_id: @response.id, user_id: session[:current_user] )

    if vote.save
      @response.votes.count
    end

    redirect_to @response.question

  end

  def mark_as_best
    question = @response.question

    if question.responses.include?(@response)
      question.update(response_id: @response.id)
    end

    redirect_to @response.question
  end

  private

  def set_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:content)
  end

end
