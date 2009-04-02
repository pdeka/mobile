class User < ActiveRecord::Base

  has_and_belongs_to_many :dimensions
  has_many :user_ratings, :dependent => :destroy

  def to_label
   firstname + ' ' + lastname
  end

end
