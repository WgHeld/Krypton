require "rails_helper"

describe "create start event", :type => :api do

  subject do
    post_json "/api/events/start", {
      :device => device_reference
    }.to_json
  end

  let(:device) { create(:device) }
  let(:device_reference) { device.reference }


  it "returns succefully" do
    subject
    expect(last_response.status).to eql(201)
  end

  it "returns succefully" do
    subject
    expect(last_response.body).to eql("{\"device_reference\":\"dw\",\"type\":\"start\"}")
  end

  it "creates event" do
    expect do
      subject
    end.to change { Event.count }
  end

  context "unkown device" do
    let(:device_reference) { "unkown" }

    it "returns not found" do
      subject
      expect(last_response.status).to eql(404)
    end
  end

end
