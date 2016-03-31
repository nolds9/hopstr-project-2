class User < ActiveRecord::Base
  has_many :pubs # NHO: would recommend adding `dependent: :destroy` to this has_many relationships:
  # so that if any user is deleted, their associated pubs are also deleted. Prevents "orphan" records
  has_many :beers, through: :pubs
  has_many :reviews
end
