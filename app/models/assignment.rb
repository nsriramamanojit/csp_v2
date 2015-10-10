class Assignment < ActiveRecord::Base
  #Relations
  belongs_to :role
  belongs_to :user

  validates :user_id, presence: true
  validates :role_id, presence: true
end
