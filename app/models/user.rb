class User < ActiveRecord::Base

  has_many :task

  validates :name, presence: true

end
