class UserRating < ActiveRecord::Base

  belongs_to :user

  belongs_to :dimension

  def to_label
    dimension.name + ' : ' + rating.to_s
  end
  
end
