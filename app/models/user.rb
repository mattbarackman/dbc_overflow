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

  def upvote!(question)
    self.votes.create(:question_id => question.id)
  end
end
