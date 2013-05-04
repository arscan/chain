class Check < ActiveRecord::Base
  belongs_to :activity
  attr_accessible :datetime

  validates :datetime, presence: true
end
