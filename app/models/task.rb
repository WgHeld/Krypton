class Task < ActiveRecord::Base
  STATE_RUNNING  = 'running'
  STATE_FINISHED = 'finished'

  scope :no_user,         -> { where({user: nil}) }
  scope :needs_attention, -> { where(["user_id IS NULL OR state = ?", STATE_RUNNING]) }
  scope :running,         -> { where({:state => STATE_RUNNING }) }
  scope :finished,        -> { where({:state => STATE_FINISHED }) }

  belongs_to :user
  belongs_to :device
  has_many   :events # TODO or one start, one end?

  validates :user_id,    presence: true, :allow_nil => true
  validates :device_id,  presence: true
  validates :state,      presence: true
  validates :points,     presence: true
  validates :started_at, presence: true

  delegate :image, :description, to: :device

  # -------------------------------------------------------

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

  # -------------------------------------------------------

  def running?
    state == STATE_RUNNING
  end

  def finished?
    state == STATE_FINISHED
  end

  def claimed?
    !user.nil?
  end

  # -------------------------------------------------------

  def user_image
    user.try(:image) || '/unknown.png'
  end

  def css
    # todo
    if running?
      'running'
    elsif !claimed?
      'unclaimed'
    else
      'finished'
    end
  end

  def expected_points
    10000 - (Time.now - self.started_at).to_i
    # Scoreboard.expected_points(self)
  end

  private

  def calculate_points
    if claimed? && finished?
      self.points = expected_points
    end
  end

end
