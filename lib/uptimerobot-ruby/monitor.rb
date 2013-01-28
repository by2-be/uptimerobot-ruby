module UptimeRobot
  class Monitor
    def initialize(params)
      @id = params[:id]
      @name = params[:name]
      @url = params[:url]
    end

    def self.create(params)
      response = post params
      new(params.merge(:id => response["monitor"]["id"]))
    end

    def self.post(params)
      UptimeRobot::Client.request("/newMonitor", params)
    end
  end
end
