module AndreaniApi
  class Auth
    def initialize(api_key = nil, api_secret = nil, sandbox = false)
      @api_key = api_key || ENV["ANDREANI_API_USER"]
      @api_secret = api_secret || ENV["ANDREANI_API_KEY"]

      # No trailing slash / at the end
      case sandbox
      when true  then @base_uri = "https://api.andreani.com"
      when false then @base_uri = "https://api.qa.andreani.com"
      end
    end

    def login
      endpoint = "#{@base_uri}/login"

      begin
        response = RestClient.post endpoint, { "api-key" => @api_key, "secret-key" => @api_secret }
        result   = JSON.parse(response, object_class: OpenStruct)
        return result
      rescue => e
        return JSON.parse(e.response, object_class: OpenStruct)
      end
    end

  end # AndreaniApi::Auth
end
