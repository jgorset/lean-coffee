class Room < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end
end
