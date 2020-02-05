module AndreaniApi
  class Auth
    def initialize(user = nil, pass = nil, sandbox = false)
      @user = user || ENV["ANDREANI_API_USER"]
      @pass = pass || ENV["ANDREANI_API_KEY"]

      # No trailing slash / at the end
      case sandbox
      when false then @base_uri = "https://api.andreani.com"
      when true  then @base_uri = "https://api.qa.andreani.com"
      end
    end

    def get_token
      endpoint = "#{@base_uri}/login"
      begin
        uri = URI.parse("#{endpoint}")
        request = Net::HTTP::Get.new(uri)
        auth = "Basic " + Base64.encode64("#{@user}:#{@pass}").chomp
        request["Authorization"] = auth
        request.content_type = "application/json"
        req_options = {
          use_ssl: uri.scheme == "https",
          read_timeout: 2,
        }
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.read_timeout = 2
          http.request(request)
        end

        # Return token
        result = response['x-authorization-token']
        return result
      rescue => e
        return JSON.parse(e, object_class: OpenStruct)
      end
    end
  end # AndreaniApi::Auth
end
