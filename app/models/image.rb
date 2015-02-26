class Image < ActiveRecord::Base
  belongs_to :article
  has_attached_file :photo, :styles => { :thumbnail => "50x50>", :large => "320x240>" }
  validates_attachment_presence :photo, :content_type => /\Aimage\/.*\Z/
end
