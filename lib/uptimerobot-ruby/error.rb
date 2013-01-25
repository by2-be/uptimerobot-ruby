module UptimeRobot
  class Error < StandardError
  end

  class RequestError < Error
    def initialize(code, message)
      super("#{code}: #{message}")
    end
  end
end
