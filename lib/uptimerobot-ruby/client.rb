module UptimeRobot
  class Client
    PARAMS = {
      "name" => "monitorFriendlyName",
      "url" => "monitorURL",
      "type" => "monitorType"
    }

    def self.api_key=(key)
      @key = key
    end

    def self.api_key
      "apiKey=#{@key}"
    end

    def self.format
      "format=json&noJsonCallback=1"
    end

    def self.get(options)
      request :get, format_options(options) 
    end

    # Transform the options hash to string
    #
    # @return [String] The option params
    def self.format_options(options=[])
      options.each_with_object([]) do |array, new_array|
        new_array << array.join("=")
      end.join("&")
    end

    def self.map_param(param)
      PARAMS[param.to_s]
    end

    def self.base_url
      "http://api.uptimerobot.com/newMonitor"
    end

    def self.url(options)
      base_url + "?" + api_key + "&" + options + "&" + format
    end

    def self.request(method, options)
      response = HTTParty.send(method, url(options))

      if response["stat"] == "fail"
        raise UptimeRobot::RequestError.new(response["id"], response["message"])
      elsif response.code == 500
        raise UptimeRobot::RequestError.new(500, "Internal Server Error")
      end
    end
  end
end
