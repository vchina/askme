class UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)
    @user = User.create(user_params)

    redirect_to questions_path, notice: 'Вы успешно зарегистрировались'
  end

  def new
    debugger
    @user = User.new
  end
end
