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

    respond_to do |format|
      if (@user)
        session[:user] = @user
#        flash[:notice] = 'Login was successfully created.'
#        format.iphone { render :action => "index" }
      else
        flash[:error] = 'Login was not successful.'
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
