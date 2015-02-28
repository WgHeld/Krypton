class Api::EventsController < ApplicationController

  def create
    type   = params[:type]
    device = find_device(params[:device])
    # user  = find_device(params[:user])

    @event = Event.create!({
      :type             => type,
      :device_reference => device.reference
      # :user_reference => user_reference
    })


    json = @event.as_json(only: [:device_reference, :type])
    render :json => json, :status => 201
  end

  private

  def find_device(device_reference)
    Device.where(:reference => device_reference).first.tap do |device|
      unless device
        raise NotFound, "no device found for '#{device_reference}'"
      end
    end
  end

end
