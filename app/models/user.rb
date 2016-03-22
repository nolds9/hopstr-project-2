class User < ActiveRecord::Base
  has_many :pubs
  has_many :beers, through: :pubs
  has_many :reviews
end
