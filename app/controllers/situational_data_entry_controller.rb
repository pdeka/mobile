class SituationalDataEntryController < ApplicationController

  def index

  end

  def create
    situational_data = SituationalData.new
    situational_data.location = params['location']
    situational_data.accompanying_people = params['accompanying_people']

    rating_session = session[:rating_session]
    rating_session.situational_data = situational_data
    rating_session.save!

    if params['answer'] == 'yes'
      redirect_to '/significant_occurences'
    else
      redirect_to '/summary'
    end

  end

end
