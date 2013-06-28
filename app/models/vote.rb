class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id, :voteable_type, :value
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user_id, :presence => true

  validates_uniqueness_of :user_id, scope: [:voteable_id, :voteable_type]
  validates :voteable_type, :format => /Question|Answer|Comment/

end
