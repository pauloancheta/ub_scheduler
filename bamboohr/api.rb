module Bamboohr
  VERSION = "v1"
  class Api
    def self.call(endpoint, params: nil)
      full_uri = "https://api.bamboohr.com/api/gateway.php/unbounce/#{VERSION}/#{endpoint}"
      http = HTTP.basic_auth(user: ENV["BAMBOO_API_KEY"], pass: "x")

      if params
        http.get(full_uri, params: params)
      else
        http.get(full_uri)
      end
    end
  end
end
