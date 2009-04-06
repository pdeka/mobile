class RatingSession < ActiveRecord::Base

  belongs_to :user

  has_many :user_ratings, :dependent => :destroy

  has_one :situational_data

  def formatted_date
    created_at.strftime('%m/%d/%Y')
  end

  def formatted_time
     created_at.strftime('%I:%M%p')
  end

  def to_label
    created_at.strftime('%m/%d/%Y %I:%M%p')
  end

end
