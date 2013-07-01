class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  
  attr_accessible :content

  validates :content, :presence => true 

  def sum_votes
    return 0 if votes.empty?
    votes.inject(0){ |sum, vote| sum += vote.value }
  end

end
