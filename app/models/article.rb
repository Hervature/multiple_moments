class Article < ActiveRecord::Base
  belongs_to :header

  validates :title, presence: true
  validates :header_id, presence: true
  validates :html, presence: true
  validates :markup, presence: true
end
