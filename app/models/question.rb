class Question < ActiveRecord::Base

  belongs_to :user
  has_many :responses, dependent: :destroy

  belongs_to :best_response, class_name: 'Response', foreign_key: 'response_id'

  validates :image_path, uniqueness: { scope: :user}, presence: true
  validates_format_of :image_path, :with => URI::regexp(%w(http https))

  before_save :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end

end
