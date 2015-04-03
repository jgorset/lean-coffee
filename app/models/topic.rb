class Topic < ActiveRecord::Base
  extend Enumerize

  enumerize :status, 
    in: [:to_talk_about, :talking_about, :talked_about],
    default: :to_talk_about

  validates :status, presence: true
  validates :votes, :numericality => { :greater_than_or_equal_to => 0 }
end
