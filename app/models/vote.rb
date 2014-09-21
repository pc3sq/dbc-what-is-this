class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :response

  validates :user, uniqueness: {  scope: :response,
                                  message: "User can only vote on this response once."}
<<<<<<< HEAD
                                  
  validates_presence_of :user_id, :response_id
=======
>>>>>>> a76a56efe80d8fc8fbcd580fa39d90ee5616421d
end
