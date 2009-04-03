class SituationalData < ActiveRecord::Base

  belongs_to :rating_session

  def to_label
    location
  end

end
