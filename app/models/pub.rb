class Pub < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer
end
