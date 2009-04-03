class SignificantOccurencesController < ApplicationController
  
  def index
  end

  def create
    situational_data = session[:rating_session].situational_data
    situational_data.significant_occurences = params['significant_occurences']
    situational_data.save!

    redirect_to '/summary'
  end

end
