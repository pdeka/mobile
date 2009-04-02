class SituationalData < ActiveRecord::Base

  belongs_to :user_rating

  def to_label
    location
  end

end
