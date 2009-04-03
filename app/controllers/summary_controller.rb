class SummaryController < ApplicationController
  
  def index
    @rating_session = session[:rating_session]
  end

end
