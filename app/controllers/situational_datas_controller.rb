class SituationalDatasController < ApplicationController
  active_scaffold :situational_data do |config|
    config.label = 'Situational Data'

    config.columns = [ :location, :accompanying_people, :significant_occurences ]
    list.columns.exclude [:user_ratings]
  end
end
