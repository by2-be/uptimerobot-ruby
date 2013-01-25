module UptimeRobot
  class Monitor
    def self.create(options)
      response = UptimeRobot::Client.get(options)
    end

  end
end
