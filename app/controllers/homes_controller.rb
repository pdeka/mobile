class HomesController < ApplicationController

  layout "application"


protect_from_forgery :only => [:destroy]

  # GET /homes
  # GET /homes.xml

  def index
    @user = session[:user]
  end

  def create
    user = session[:user]
    user.dimensions.each do |dimension|
      user_rating = UserRating.new
      user_rating.rating = params["#{dimension.name}_rating"].to_i
      user_rating.rating_session = session[:rating_session]
      user_rating.dimension = dimension

      user_rating.save!
    end

    respond_to do |format|
      format.iphone { render :template => 'situational_data_entry/index' }
    end

  end

end
