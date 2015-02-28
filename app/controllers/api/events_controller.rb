class Api::EventsController < ApplicationController

  def create_start
    device = find_device(params[:device]) || raise(NotFound, "no device found for '#{params[:device]}'")
    user   = find_user(params[:user])

    @event = create_event(:start, device, user)

    start_task(device, user)

    json = @event.as_json(only: [:device_reference, :type])
    render :json => json, :status => 201
  end

  def create_end
    device = find_device(params[:device]) || raise(NotFound, "no device found for '#{params[:device]}'")
    user   = find_user(params[:user])

    @event = create_event(:end, device, user)

    end_task(device, user)

    json = @event.as_json(only: [:device_reference, :type])
    render :json => json, :status => 201
  end

  private

  def find_device(device_reference)
    Device.where(:reference => device_reference).first
  end

  def find_user(user_reference)
    User.where(:reference => user_reference).first
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
      task.user = user
      task.end!
    else
     raise(Unprocessable, "device '#{device.reference}' has no running task")
    end
  end

end
