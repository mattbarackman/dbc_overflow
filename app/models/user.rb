class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes

  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  
  validates :password, :presence => true,
                       :length => {:minimum => 5, :maximum => 40}

  has_secure_password

  def upvote!(input)
    self.votes.create(:voteable_id => input.id, :voteable_type => input.class.to_s)
  end

  def sum_question_votes
    return 0 if questions.empty?
    questions.map {|question| question.sum_votes}.reduce(:+)
  end

  def sum_answer_votes
    return 0 if answers.empty?
    answers.map {|answer| answer.sum_votes}.reduce(:+)
  end

  def favorited_answers
    winning_answer_ids = Question.all.map {|question| question.winner}
    answers.select {|answer| winning_answer_ids.include? answer.id }
  end

  def favorited_answers_count
    favorited_answers.count
  end

end
