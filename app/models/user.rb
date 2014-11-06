class User < ActiveRecord::Base
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