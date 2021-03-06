# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_filter :set_mobile_format

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '02c250caa71d6625bad0c71cc811757d'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def set_mobile_format
    if is_mobile_request?
      request.format = :iphone
    end
  end

  protected

  def is_mobile_request?
    not (request.user_agent =~ /Firefox/)
  end


end
