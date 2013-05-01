class Check < ActiveRecord::Base
  belongs_to :activity
  attr_accessible :datetime
end
