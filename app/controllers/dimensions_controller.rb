class DimensionsController < ApplicationController
  active_scaffold :dimension  do |config|
    list.columns.exclude [:users]
  end
end
