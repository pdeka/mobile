class HomesController < ApplicationController

  layout "application"

  # GET /homes
  # GET /homes.xml
  def index
#    @dimensions
    respond_to do |format|
      format.iphone
    end
  end

end
