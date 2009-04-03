class SituationalDataEntryController < ApplicationController

  def index

  end

  def create
    situational_data = SituationalData.new
    situational_data.location = params['location']
    situational_data.accompanying_people = params['accompanying_people']
    situational_data.significant_occurences = params['significant_occurences']

    rating_session = session[:rating_session]
    rating_session.situational_data = situational_data
    rating_session.save!

    @rating_session = session[:rating_session]
  end

end
