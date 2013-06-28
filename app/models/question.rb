class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  attr_accessible :title, :content
  
  validates :title, :presence => true, 
                    :uniqueness => true

  
  def sum_votes
    p "@@@@@@@@@@@@@@@@@@@@@@@@"
    p votes.inject(0){ |sum, vote| sum += vote.value }
  end
end
