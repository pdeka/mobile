class RatingSessionsController < ApplicationController
  active_scaffold :rating_session do |config|
    config.label = 'Rating Sessions'
    config.columns = [ :user, :user_ratings, :situational_data, :channel, :created_at, :updated_at]
  end
end
