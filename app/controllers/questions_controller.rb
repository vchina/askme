class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide unhide]
  def create
    question = Question.create(question_params)
    redirect_to question_path(question), notice: 'Новый вопрос создан'
  end

  def update
    @question.update(question_params)
    redirect_to question_path(@question), notice: 'Вопрос обновлён'
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Вопрос удалён'
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question.update(is_hidden: true)
    redirect_to question_path, notice: 'Вопрос скрыт'
  end

  def unhide
    @question.update(is_hidden: false)
    redirect_to question_path, notice: 'Вопрос отображен'
  end

  private
  def question_params
    params.require(:question).permit(:body, :user_id, :is_hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
