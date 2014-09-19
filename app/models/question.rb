class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  validates :image_path, presence: true
  validates_format_of :image_path, :with => URI::regexp(%w(http https))

  before_save :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end

end
