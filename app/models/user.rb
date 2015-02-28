class User < ActiveRecord::Base

  has_many :tasks

  validates :name, presence: true, uniqueness: true
  validates :reference, presence: true, uniqueness: true

  def css
    reference
  end

  def task_counter
    tasks.count
  end

  def points
    # @points ||= tasks.sum(&:points)
    @points ||= rand(10000)
  end
end
