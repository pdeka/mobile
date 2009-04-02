class UsersController < ApplicationController
  active_scaffold :user do |config|
    config.columns = [ :firstname, :lastname, :username, :dimensions, :user_ratings, :created_at, :updated_at]
  end
end
