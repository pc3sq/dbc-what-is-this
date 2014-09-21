class Response < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :content, presence: true

end
