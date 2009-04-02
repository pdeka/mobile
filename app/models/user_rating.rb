class UserRating < ActiveRecord::Base

  belongs_to :user

  belongs_to :dimension

  has_one :situational_data

  def to_label
    dimension.name + ' : ' + rating.to_s
  end

  def formatted_date
    created_at.strftime('%m/%d/%Y')
  end


  def formatted_time
     created_at.strftime('%I:%M%p')
  end
  
end
