class User < ActiveRecord::Base

  has_and_belongs_to_many :dimensions
  has_many :rating_sessions, :dependent => :destroy

  def to_label
   usernumber
  end

end
