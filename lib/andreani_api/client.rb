module AndreaniApi
  class Client
    def initialize(access_token = nil, sandbox = false)
      @access_token = access_token || ENV["ANDREANI_API_TOKEN"]

      # No trailing slash / at the end
      case sandbox
      when true  then @base_uri = "https://api.andreani.com"
      when false then @base_uri = "https://api.qa.andreani.com"
      end
    end

    # GET any available resource with or withoud ID
    # ex.: get("localidades/ID")
    def get(resource, options = nil)
      params = options
      url = "/#{resource}"
      get_response(url, params)
    end


    # POST resource
    # Client.post("pedidos", params)
    def post(resource, params)
      case resource
      when "something" then url = "/something"
      else url = "/#{resource}"
      end

      post_request(url, params)
    end

    # DELETE resource
    # Client.delete(params)
    def delete(params)
      url = "/something/descartar-envios"
      to_query = "ids=#{params}"

      delete_request(url, to_query)
    end



    private
    # GET
    def get_response(url, query = nil)
      query = "&#{query}" if query != nil || query != ""
      resource_url = "#{@base_uri}#{url}?access_token=#{@access_token}#{query}"

      begin
        response = RestClient.get(resource_url)
        result = JSON.parse(response, object_class: OpenStruct)
        return result
      rescue => e
        return JSON.parse(e.response, object_class: OpenStruct)
      end
    end # get_response

    # POST
    def post_request(url, params)
      begin
        resource_url = "#{@base_uri}#{url}?access_token=#{@access_token}"
        response = RestClient.post resource_url, params.to_json, {content_type: :json, accept: :json}
        result = JSON.parse(response, object_class: OpenStruct)
        return result
      rescue => e
        return JSON.parse(e.response, object_class: OpenStruct)
      end
    end # post_request

    # DELETE
    def delete_request(url, params)
      begin
        resource_url = "#{@base_uri}#{url}?access_token=#{@access_token}&#{params}"
        response = RestClient.delete resource_url, {content_type: :json, accept: :json}

        #result = JSON.parse(response, object_class: OpenStruct)
        return response
      rescue => e
        return JSON.parse(e.response, object_class: OpenStruct)
      end
    end # delete_request
  end # module AndreaniApi::Client
end
