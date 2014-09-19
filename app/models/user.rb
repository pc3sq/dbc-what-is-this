class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :responses
  has_many :questions

  validates :name, presence: true
  validates_format_of :name, :with => (/([a-zA-Z]|\d){2,}/) #refactor out into a CONSTANT?

end
