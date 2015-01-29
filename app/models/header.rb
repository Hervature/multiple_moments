class Header < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :articles

  validates :title, presence: true

  def self.by_slug(slug = nil)
    return friendly.find(slug) if slug
    all
  end
end
