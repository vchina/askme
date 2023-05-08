class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[edit update destroy]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан'
    else
      flash.now[:alert] = 'Есть ошибки при создании вопроса'
      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)
    redirect_to user_path(@question.user), notice: 'Вопрос обновлён'
  end

  def destroy
    @user= @question.user
    @question.destroy
    redirect_to user_path(@user), notice: 'Вопрос удалён'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
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

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
