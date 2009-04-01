class UserRating < ActiveRecord::Base

  belongs_to :user

  belongs_to :dimension
  
end
