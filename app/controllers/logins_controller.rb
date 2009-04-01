class LoginsController < ApplicationController

  layout "application"

  def index
  end

  def new
  end

  def create
    reset_session
    puts "I am in create !!!!!!!!!!!!!!!!!!!!"

    @user = User.find :first, :conditions => [ "username = ?", params[:username]]

    if (@user)
      session[:user] = @user
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


end
