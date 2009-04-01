class User < ActiveRecord::Base

  has_many :dimensions
  has_many :user_ratings, :dependent => :destroy
  
end
