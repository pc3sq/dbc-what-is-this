class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  validates_format_of :image_path, :with => URI::regexp(%w(http https))

end
