class Movie < ActiveRecord::Base
  # validations
  validates_presence_of :name

  # pagination
  paginates_per 15
end

