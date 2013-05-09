class Activity < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: {scope: :user_id}

  has_many :checks
  belongs_to :user
end
