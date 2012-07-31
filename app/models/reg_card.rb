class RegCard < ActiveRecord::Base
  attr_accessible :answer, :group_id, :question, :user_id

  belongs_to :user
  belongs_to :group

  validates :question, presence: true
  validates :answer, presence: true

end
