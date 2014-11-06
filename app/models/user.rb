class User < ActiveRecord::Base
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 8..128},
                       :on => :create

  validates :password, :confirmation => true,
                       :length => {:within => 8..128},
                       :allow_blank => true,
                       :on => :update

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                   format:     { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }

  validates :type, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable

  self.inheritance_column = :type

  # Subclass user
  def self.types
    %w(Editor Writer Reader)
  end

  scope :editors, -> { where(type: 'Editor') }
  scope :writers, -> { where(type: 'Writer') }
  scope :readers, -> { where(type: 'Reader') }
end

class Editor < User; end
class Writer < User; end
class Reader < User; end