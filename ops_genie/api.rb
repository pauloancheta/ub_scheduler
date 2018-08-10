module OpsGenie
  VERSION = "v2"
  class Api
    def self.call(endpoint, params: nil)
      full_uri = "https://api.opsgenie.com/#{VERSION}/#{endpoint}"
      http = HTTP.auth("GenieKey #{ENV["OPS_GENIE_API_KEY"]}")

      if params
        http.get(full_uri, params: params)
      else
        http.get(full_uri)
      end
    end
  end
end
