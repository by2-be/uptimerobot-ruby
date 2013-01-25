require "spec_helper"

describe UptimeRobot::Client do
  describe "format options" do
    it "should return an options string" do
      UptimeRobot::Client.format_options(:name => "john").should == "name=john"
    end

    it "should return an options string" do
      UptimeRobot::Client.format_options().should == ""
    end

    it "should return an options string" do
      UptimeRobot::Client.format_options(
        :name => "john", :url => "http://example.com").should == "name=john&url=http://example.com"
    end
  end

  describe "url" do
    it "should return the complete url" do
      UptimeRobot::Client.stub(:api_key).and_return("apiKey=ABC")
      UptimeRobot::Client.stub(:format).and_return("format=json")

      UptimeRobot::Client.url("options=options").should == "http://api.uptimerobot.com/newMonitor?apiKey=ABC&options=options&format=json"
    end
  end

  describe "request" do
    it "should return an error if there're wrong params provided" do
      HTTParty.stub(:send).and_return({"stat"=>"fail", "id"=>"207", "message"=>"The monitor already exists"})

      lambda {UptimeRobot::Client.request(:method, "options")}.should raise_error(UptimeRobot::RequestError)
    end

    it "should return an error if there's a internal server error" do
      response = double("response")
      response.stub(:code).and_return(500)
      response.stub(:[])

      HTTParty.stub(:send).and_return(response)

      lambda {UptimeRobot::Client.request(:method, "options")}.should raise_error(UptimeRobot::RequestError)
    end
  end
end

