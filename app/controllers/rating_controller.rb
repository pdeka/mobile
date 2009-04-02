class RatingController < ApplicationController
  def index
    @dimension = session[:dimension]
    @user = session[:user]
  end

  def create
    puts '!!!!! RatingController create !!!!!'
    rating = UserRating.new
    rating.rating = params[:selected_rating]
    rating.user = session[:user]
    rating.dimension = session[:dimension]

    rating.channel = 'mobile'
      
    rating.save!

    redirect_to '/situational_data_entry'
  end
end
