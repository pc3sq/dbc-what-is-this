class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :responses
  has_many :questions, dependent: :destroy

  validates :name, presence: true
  validates_format_of :name, :with => (/([a-zA-Z]|\d){2,}/) #refactor out into a CONSTANT?

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)

  validates :password, presence: true
  validates_format_of :password, :with => (/([a-zA-Z]|\d){2,}/) #refactor out into a CONSTANT?
end
