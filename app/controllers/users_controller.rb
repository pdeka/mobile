class UsersController < ApplicationController
  active_scaffold :user do |config|
    config.columns = [ :usernumber, :dimensions, :rating_sessions, :created_at, :updated_at]
  end
end
