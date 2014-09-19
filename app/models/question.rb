class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  before_save :create_slug

  validates_format_of :image_path, :with => URI::regexp(%w(http https))

  def create_slug
    # self.title.gsub(' ', '-')
    self.slug = self.title.parameterize
  end

end
