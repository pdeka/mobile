class SummaryController < ApplicationController
  
  def index
    @user_rating = session[:user_rating]
  end

end
