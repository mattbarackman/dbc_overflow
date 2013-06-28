class Vote < ActiveRecord::Base
  attr_accessible :user_id, :
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user_id, :presence => true
  validates :question_id, :presence => true

end
