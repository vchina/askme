module QuestionsHelper
  def show_author(question)
    if question.author_id.present?
      link_to"@#{question.author.nickname}", user_path(question.author)
    elsif question.author == nil
      'Автор вопроса неизвестен'
    end
  end
end
