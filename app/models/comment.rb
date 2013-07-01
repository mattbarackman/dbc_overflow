class Comment < ActiveRecord::Base
  attr_accessible :user_id, :commentable_id, :commentable_type, :body
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :user_id, :presence => true
  validates :commentable_type, :format => /Question|Answer/

  before_save :strip_comment

  def parent
    commentable_type.constantize.find(commentable_id)
  end

  private

  def strip_comment
    self.body = body.strip
  end
end