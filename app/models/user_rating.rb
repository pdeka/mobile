class UserRating < ActiveRecord::Base

  belongs_to :rating_session

  belongs_to :dimension

  def to_label
    dimension.name + ' : ' + rating.to_s
  end

end
