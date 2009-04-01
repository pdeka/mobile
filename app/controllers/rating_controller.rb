class RatingController < ApplicationController
  def index
    @dimension = Dimension.find_by_id(session[:dimension_id])
    @user = session[:user]
  end

end
