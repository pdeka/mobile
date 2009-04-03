class UserRatingsController < ApplicationController
  active_scaffold :user_rating do |config|
    config.label = 'User Ratings'
    config.columns = [ :rating_session, :dimension, :rating, :created_at, :updated_at]
  end
end
