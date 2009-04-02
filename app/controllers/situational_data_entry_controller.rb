class SituationalDataEntryController < ApplicationController

  def index

  end

  def create
    situational_data = SituationalData.new
    situational_data.location = params['location']
    situational_data.accompanying_people = params['accompanying_people']

    user_rating = session[:user_rating]
    user_rating.situational_data = situational_data
    user_rating.save!

    if params['answer'] == 'yes'
      redirect_to '/significant_occurences'
    else
      redirect_to '/summary'
    end

  end

end
