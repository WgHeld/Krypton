class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  class NotFound < StandardError; end
  class Unprocessable < StandardError; end

  rescue_from 'Exception' do |exception|
    render :json => { :error => exception.message }, :status => 500
  end

  rescue_from 'ApplicationController::NotFound' do |exception|
    render :json => { :error => exception.message }, :status => 404
  end

  rescue_from 'ApplicationController::Unprocessable' do |exception|
    render :json => { :error => exception.message }, :status => 422
  end

  private

  def find_device(device_reference)
    Device.where(:reference => device_reference).first
  end

  def find_user(user_reference)
    User.where(:reference => user_reference).first
  end

  def find_task(task_id)
    Task.where(:id => task_id).first
  end

  def create_event(type, device, user)
    Event.create!({
      :type             => type,
      :device_reference => device.reference,
      :user_reference   => user.try(:reference),
    })
  end

  def start_task(device, user)
    if device.running_task
      #TBD update timestamp???
    else
      Task.new({
        :device => device,
        :user   => user,
      }).start!
    end
  end

  def end_task(device, user)
    if task = device.running_task
      task.user = user if user
      task.end!
    else
     raise(Unprocessable, "Device '#{device.reference}' has no running task")
    end
  end

  def claim_task(task, user)
    task.claim!(user)
  end
end
