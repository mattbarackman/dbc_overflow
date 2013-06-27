module QuestionsHelper

  def owner(question)
    if current_user
      user = current_user
      return true if user.id == question.user_id
    end
    false
  end

end
