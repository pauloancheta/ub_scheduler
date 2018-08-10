module Bamboohr
  VERSION = "v1"
  class Api
    def self.call(endpoint)
      HTTP.basic_auth(user: ENV["BAMBOO_API_KEY"], pass: "x").get(
        "https://api.bamboohr.com/api/gateway.php/unbounce/#{VERSION}/#{endpoint}"
      )
    end
  end
end
