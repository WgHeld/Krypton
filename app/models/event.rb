class Event < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  belongs_to :event

  validates :device_reference, presence: true
  validates :type, presence: true
end
