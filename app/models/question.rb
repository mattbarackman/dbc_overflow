class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  attr_accessible :title, :content, :winner 
  validates :title, :presence => true, 
  :uniqueness => true
  
  def sum_votes
    return 0 if votes.empty?
    votes.inject(0){ |sum, vote| sum += vote.value }
  end

  def get_winner
    Answer.find(winner)
  end

  def current_user_is_owner?
    if current_user
      return true if current_user.id == user_id
    end
    false
  end
end
