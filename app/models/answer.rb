class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  attr_accessible :content

  validates :content, :presence => true 

end
