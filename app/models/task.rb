class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :device
  has_many :events # TODO or one start, one end?

  validates :user_id, presence: true
  validates :device_id, presence: true
  validates :state, presence: true
  validates :points, presence: true

end
