require "rails_helper"

describe "create end event", :type => :api do

  subject do
    post_json "/api/events/end", {
      :device => device.reference,
      # :user   => user_reference, # TBD
    }.to_json
  end

  let(:device) { create(:device) }

  it "requires task to be started" do
    subject
    expect(last_response.status).to eql(422)
  end

  context "when runnin task exists"  do
    let(:device) { create(:device, :with_running_task) }

    it "returns succefully" do
      subject
      expect(last_response.status).to eql(201)
    end

    it "creates event" do
      expect do
        subject
      end.to change { Event.count }
    end

    let(:task) { device.running_task }

    it "ends task" do
      expect do
        subject
      end.to change { task.reload.state }
    end
  end
end
