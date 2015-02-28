module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def post_json(path, json_string)
    post path, json_string, "CONTENT_TYPE" => "application/json"
  end

end

RSpec.configure do |config|
  config.include ApiHelper, :type => :api
end
