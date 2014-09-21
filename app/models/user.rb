class User < ActiveRecord::Base

  has_secure_password

  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)

  validates :password, presence: true
  validates_format_of :password, :with => (/([a-zA-Z]|\d){2,}/)

end
