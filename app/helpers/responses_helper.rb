module ResponsesHelper

  def best_response?(response)
    response.question.best_response == response
  end

end
