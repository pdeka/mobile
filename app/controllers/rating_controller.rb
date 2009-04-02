class RatingController < ApplicationController
  def index
    @dimension = session[:dimension]
    @user = session[:user]
  end

  def create
    rating = UserRating.new
    rating.rating = params[:selected_rating]
    rating.user = session[:user]
    rating.dimension = session[:dimension]

    rating.channel = 'mobile'
    rating.reference_number = 1000000 + rand(8999999)
      
    rating.save!

    session[:user_rating] = rating

    redirect_to '/situational_data_entry'
  end
end
