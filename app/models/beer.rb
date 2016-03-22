class Beer < ActiveRecord::Base
  has_many :pubs
  has_many :users, through: :pubs
  has_many :reviews
end
