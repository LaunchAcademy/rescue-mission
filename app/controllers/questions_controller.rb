class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers

    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    # title = params["question"]["title"]
    # description = params["question"]["description"]

    # @question = Question.new(title: title, description: description)
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question has been added"
      redirect_to @question
    else
      flash.now[:notice] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end

