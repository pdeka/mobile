class LoginsController < ApplicationController

  layout "application"

  def index
  end

  def new
  end

  def create
    reset_session

    @user = User.find :first, :conditions => [ "usernumber = ? and password = ?", params[:usernumber], params[:password]]

    if (@user)
      session[:user] = @user
      open_ratings_session @user
      redirect_to homes_path
    else
      flash[:error] = 'Login was not successful.'
      respond_to do |format|
        format.iphone { render :action => "index" }
      end
    end
  end

  def reset_session
    request.reset_session
    @_session = request.session
    response.session = @_session
  end

  private

  def open_ratings_session user
    rating_session = RatingSession.new
    rating_session.channel = 'mobile'
    rating_session.reference_number = 1000000 + rand(8999999)
    rating_session.user = user
    rating_session.save!

    session[:rating_session] = rating_session
  end


end
