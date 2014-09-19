class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :responses
  has_many :questions

end
