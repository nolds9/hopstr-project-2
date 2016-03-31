class Beer < ActiveRecord::Base
  has_many :pubs
  has_many :users, through: :pubs
  has_many :reviews # NHO: would recommend adding `dependent: :destroy` to this has_many relationships:
  # so that if any beer is deleted, their associated reviews are also deleted. Prevents "orphan" records
end
