class Group < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :reg_cards

  validates :name, presence: true
end
