class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :response

  validates :body, presence: true, uniqueness: {scope: :user}

end
