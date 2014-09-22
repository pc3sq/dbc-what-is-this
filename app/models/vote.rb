class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :response

  validates :user, uniqueness: {  scope: :response,
                                  message: "User can only vote on this response once."}

  validates_presence_of :user_id, :response_id

end
