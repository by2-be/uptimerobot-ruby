require "spec_helper"

describe UptimeRobot::Client do
  describe "map_options" do
    it "should map the options" do
      options = {:name => "test"}
      UptimeRobot::Client.map_options(options).should == {:monitorFriendlyName => "test"}
    end
  end

  describe "base params" do
    it "should return the base options if there's an api key provided" do
      UptimeRobot::Client.api_key = "123"
      UptimeRobot::Client.base_params.should == {:apiKey => "123", :format => "json", :noJsonCallback => 1, :monitorType => 1}
    end
  end

  describe "request" do
    before(:each) do
      UptimeRobot::Client.stub(:url)
      UptimeRobot::Client.stub(:options)
    end

    it "should return an error if there're wrong params provided" do
      HTTParty.stub(:get).and_return({"stat"=>"fail", "id"=>"207", "message"=>"The monitor already exists"})

      lambda {UptimeRobot::Client.request("path", {:name => "test"})}.should raise_error(UptimeRobot::RequestError)
    end

    it "should return an error if there's a internal server error" do
      response = double("response")
      response.stub(:code).and_return(500)
      response.stub(:[])

      HTTParty.stub(:get).and_return(response)

      lambda {UptimeRobot::Client.request("path", {:name => "test"})}.should raise_error(UptimeRobot::RequestError)
    end
  end
end

