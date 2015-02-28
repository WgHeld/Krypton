require "rails_helper"

describe "create start event", :type => :api do

  subject do
    post_json "/api/events/start", {
      :device => device_reference,
      # :user   => user_reference, # TBD
    }.to_json
  end

  let(:device) { create(:device) }
  let(:device_reference) { device.reference }

  it "returns succefully" do
    subject
    expect(last_response.status).to eql(201)
  end

  it "returns created event" do
    subject
    expect(last_response.body).to eql("{\"device_reference\":\"#{device_reference}\",\"type\":\"start\"}")
  end

  it "creates event" do
    expect do
      subject
    end.to change { Event.count }
  end

  it "creates task" do
    expect do
      subject
    end.to change { Task.count }
  end

  context "when running task exists"  do
    let!(:device) { create(:device, :with_running_task) }

    it "does not create task" do
      expect do
        subject
      end.to_not change { Task.count }
    end
  end

  context "when running finished tasks"  do
    let!(:device) { create(:device, :with_finished_task) }

    it "does not create task" do
      expect do
        subject
      end.to change { Task.count }
    end
  end

  context "when device is unkown" do
    let(:device_reference) { "unkown" }

    it "returns not found" do
      subject
      expect(last_response.status).to eql(404)
    end
  end

end
