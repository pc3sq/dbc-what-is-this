class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  validates :image_path, presence: true
end
