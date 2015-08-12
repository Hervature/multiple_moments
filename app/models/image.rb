class Image < ActiveRecord::Base
  belongs_to :article
  has_attached_file :photo, :styles => { :thumbnail => "50x50>", :medium => "160x120>", :large => "320x240>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
