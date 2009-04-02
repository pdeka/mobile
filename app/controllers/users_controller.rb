class UsersController < ApplicationController
  active_scaffold :user do |config|
    config.columns = [ :usernumber, :dimensions, :user_ratings, :created_at, :updated_at]
  end
end
