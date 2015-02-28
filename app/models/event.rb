class Event < ActiveRecord::Base

  belongs_to :event

  validates :device_reference, presence: true
  validates :type, presence: true
end
