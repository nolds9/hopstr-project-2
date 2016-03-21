class User < ActiveRecord::Base
  has_many :pubs
  has_many :beers
end
