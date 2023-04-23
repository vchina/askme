class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_question, only: %i[show edit update destroy hide unhide]
  def create
    question = Question.create(question_params)
    # debugger
    redirect_to question_path(question)
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def show
  end

  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question.update(is_hidden: true)
    redirect_to questions_path
  end

  def unhide
    @question.update(is_hidden: false)
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:body, :user_id, :is_hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
