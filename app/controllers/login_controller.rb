class LoginController < ApplicationController
  def login
    reset_session

  end

  def reset_session
    request.reset_session
    @_session = request.session
    response.session = @_session
  end

end
