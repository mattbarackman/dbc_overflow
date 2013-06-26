class Question < ActiveRecord::Base
  # belongs_to :user
  attr_accessible :title, :content
  
  validates :title, :presence => true, 
                    :uniqueness => true

end
