class Device < ActiveRecord::Base

  has_many :tasks

  validates :name,      presence: true
  validates :reference, presence: true
  validates :strategy,  presence: true

  def to_s
    "Device#{id}: #{name}, ref: #{reference}"
  end

  def running_task
    tasks.last
  end
end
