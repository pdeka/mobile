class UserRatingsController < ApplicationController
  active_scaffold :user_rating do |config|
    config.label = 'User Ratings'
    config.columns = [ :user, :dimension, :rating, :situational_data, :channel, :created_at, :updated_at]
  end
end
