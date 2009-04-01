class HomesController < ApplicationController

  layout "application"

  # GET /homes
  # GET /homes.xml
  def index
    @user = session[:user]
    @dimensions = @user.dimensions 
    respond_to do |format|
      format.iphone
    end
  end

  def create
    puts "!!!! Home Controller Create!!!"
    session[:dimension] = Dimension.find_by_id(params[:selected_dimension_id])
    redirect_to '/rating'
  end

end
