class Task < ActiveRecord::Base
  STATE_RUNNING  = 'running'
  STATE_FINISHED = 'finished'

  scope :needs_attention, -> { where.not(user: nil, state: STATE_FINISHED) }
  scope :running,         -> { where({:state => STATE_RUNNING }) }

  belongs_to :user
  belongs_to :device
  has_many   :events # TODO or one start, one end?

  validates :user_id,    presence: true, :allow_nil => true
  validates :device_id,  presence: true
  validates :state,      presence: true
  validates :points,     presence: true
  validates :started_at, presence: true

  def start!
    self.points = 0
    self.state = STATE_RUNNING
    self.started_at = Time.now
    save!
  end

  def end!
    self.state = STATE_FINISHED
    self.finished_at = Time.now
    calculate_points
    save!
  end

  def claim!(user)
    self.user = user
    calculate_points
    save!
  end

  def finished?
    state == STATE_FINISHED
  end

  def expected_points
    100
    # Scoreboard.expected_points(self)
  end

  private

  def calculate_points
    if user && finished?
      self.points = expected_points
    end
  end

end
