class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])

    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer has been added"
      redirect_to @question
    else
      @answers = @question.answers
      
      flash.now[:notice] = @answer.errors.full_messages.to_sentence
      render :'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end