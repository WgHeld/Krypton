require "rails_helper"

describe "index of users", :type => :api do

  subject do
    get "/client/users"
  end

  let!(:user1) { create(:user) }

  it "is successful" do
    subject
    expect(last_response.status).to eql(200)
  end

  it "returns users" do
    subject
    expect(last_response.body).to eql(
      %Q|[{"name":"#{user1.name}","reference":"#{user1.reference}","image":null,"css":"#{user1.reference}","points":0,"task_counter":0}]|
    )
  end

end
