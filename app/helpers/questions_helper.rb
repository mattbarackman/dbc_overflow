module QuestionsHelper

  # REVIEW: this doesn't belong here, it should be moved to the question model.
  # useage: question.owner?(current_user)
  def owner(question)
    if current_user
      # REVIEW: I don't understand this line. why not current_user.id?
      # Why don we need this extra variable (user)?
      user = current_user
      return true if user.id == question.user_id
    end
    false
  end

end
