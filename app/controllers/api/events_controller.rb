class Api::EventsController < ApplicationController

  def create_start
    device = find_device(params[:device]) || raise(NotFound, "No Device found for '#{params[:device]}'")
    user   = find_user(params[:user])

    @event = create_event(:start, device, user)

    start_task(device, user)

    json = @event.as_json(only: [:device_reference, :type])
    render :json => json, :status => 201
  end

  def create_end
    device = find_device(params[:device]) || raise(NotFound, "No Device found for '#{params[:device]}'")
    user   = find_user(params[:user])

    @event = create_event(:end, device, user)

    end_task(device, user)

    json = @event.as_json(only: [:device_reference, :type])
    render :json => json, :status => 201
  end
end
