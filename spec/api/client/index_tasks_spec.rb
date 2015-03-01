require "rails_helper"

describe "index of tasks", :type => :api do

  subject do
    get "/client/tasks"
  end

  let!(:task1) { create(:task) }
  let!(:task2) { create(:task, :finished) }
  let!(:task3) { create(:task, :unclaimed) }

  it "is successful" do
    subject
    expect(last_response.status).to eql(200)
  end

  it "returns tasks" do
    subject
    expect(last_response.body).to eql("[" +
      "{\"image\":null,\"description\":null,\"css\":\"running\",\"expected_points\":10000,\"user_image\":null}," +
      "{\"image\":null,\"description\":null,\"css\":\"finished\",\"expected_points\":10000,\"user_image\":null}" +
      "]"
    )
  end

end
