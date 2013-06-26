class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  
  validates :password, :presence => true,
                       :on => :create,
                       :length => {:minimum => 5, :maximum => 40}

  has_secure_password

end
