class Room < ActiveRecord::Base
  has_many :topics

  def to_param
    slug
  end
end
