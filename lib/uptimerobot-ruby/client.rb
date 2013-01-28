module UptimeRobot
  class Client
    PARAMS = {
      :name => :monitorFriendlyName,
      :url => :monitorURL,
    }

    def self.api_key=(key)
      @api_key = key
    end

    def self.base_params
      if @api_key
        {:apiKey => @api_key, :format => "json", :noJsonCallback => 1, :monitorType => 1}
      else
        raise UptimeRobot::RequestError.new(100, "apiKey not mentioned")
      end
    end

    def self.base_url
      "http://api.uptimerobot.com"
    end

    def self.map_options(options)
      options.each_with_object({}) do |k_v, hash| 
        hash[PARAMS[k_v.first.to_sym]] = k_v.last
      end
    end

    def self.url(path)
      base_url + path 
    end

    def self.options(params)
      map_options(params).merge!(base_params)
    end

    def self.request(path, params)
      response = HTTParty.get(url(path), :query => self.options(params))

      if response["stat"] == "fail"
        raise UptimeRobot::RequestError.new(response["id"], response["message"])
      elsif response.code == 500
        raise UptimeRobot::RequestError.new(500, "Internal Server Error")
      end

      response
    end
  end
end
