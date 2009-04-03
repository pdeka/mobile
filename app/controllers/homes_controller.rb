class HomesController < ApplicationController

  layout "application"

  # GET /homes
  # GET /homes.xml
  def index
    @user = session[:user]
    @dimensions = @user.dimensions.dup

    # filter out dimensions which have already been rated
    rating_session = session[:rating_session]
    rating_session.user_ratings.each do |rating|
      @dimensions.delete rating.dimension
    end

    respond_to do |format|
      format.iphone
    end
  end

  def create
    session[:dimension] = Dimension.find_by_id(params[:selected_dimension_id])

    redirect_to '/rating'
  end

end
