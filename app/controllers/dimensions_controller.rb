class DimensionsController < ApplicationController
  active_scaffold :dimension  do |config|
    config.columns = [ :name, :description, :created_at, :updated_at ]
    list.columns.exclude [:users]  
  end
end
