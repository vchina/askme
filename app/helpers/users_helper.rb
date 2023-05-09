module UsersHelper
  def show_nickname(current_user)
    "@#{current_user&.nickname}"
  end
end
