class Article < ActiveRecord::Base
  before_save :publish_timestamp
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  belongs_to :header

  validates :title, presence: true
  validates :header_id, presence: true
  validates :html, presence: true
  validates :markup, presence: true

  private
    # Check if publish date should be assigned
    def publish_timestamp
      if self.published && self.published_at.blank?
        self.published_at = DateTime.now
      end
    end
end
