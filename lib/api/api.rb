module RapleafApi
  class Api

    def initialize(api_key)
      @API_KEY = "?api_key=#{api_key}"
      @PERSON_URL = "http://api.rapleaf.com/v3/person/"
      @GRAPH_URL = "http://api.rapleaf.com/v2/graph/"
    end

    def query(params)
			raise InvalidParams, "Invalid query, please use an :opts hash to specify your options" unless !params[:opts].nil?
      case params[:type]
				when :person
          return Person.new(person_request(params[:opts]))
        when :graph
          return Graph.new(graph_request(params[:opts]))
        else
          raise InvalidParams, "Invalid query type, use either :graph or :person"
      end
    end

    private

    def request(url)
      resp = Net::HTTP.get_response(URI.parse(url))
      if resp.code == "200"
        return resp.body
      else
        raise_response_errors(resp.code)
      end
    end

    def person_request(params)
      raise InvalidParams, "Your params hash was formatted incorrectly!" unless url = verify_and_build_person_url(params)
      request(url)
    end

    def graph_request(params)
      raise InvalidParams, "Your params hash was formatted incorrectly!" unless url = verify_and_build_graph_url(params)
      request(url)
    end

    def verify_and_build_person_url(params)
      if params.size == 1
        return false unless params[:email]
        return @PERSON_URL + "email/#{params[:email]}" + @API_KEY
      else
        return false unless params[:id] && (params[:hash] || params[:site])
        return @PERSON_URL + (!params[:hash].nil? ? "hash/#{params[:hash]}/#{params[:id]}" : "web/#{params[:site]}/#{params[:id]}") + @API_KEY 
      end
    end

    def verify_and_build_graph_url(params)
      if params.size == 1
        return false unless params[:id]
        return @GRAPH_URL + params[:id] + @API_KEY
      elsif params.size == 2
        return false unless params[:id] && (params[:by_rapid] || params[:return_rapid])
        return @GRAPH_URL + params[:id] + @API_KEY + "&" + ( !params[:by_rapid].nil? ? "n=2" : "n=1")
      else
        return false
      end
    end

    def raise_response_errors(code)
      case code 
        when "202"
          raise AcceptedException, "This person is currently being searched. Please check back shortly."
        when "400"
          raise MalformedRequestException, "Malformed request."
        when "401"
          raise ApiKeyInvalidException, "API Key invalid"
        when "403"
          raise RateLimitExceededException, "API Key query limit exceded, please contact developer@rapleaf.com to have your limit increased."
        when "404"
          raise PersonNotFoundException, "We do not have this person in our system. If you would like better results, consider supplying the email address."
        when "500"
          raise InternalServerError, "There was an unexpected error on our server. This should be very rare and if you see it please contact developer@rapleaf.com."
        else
          raise "Unkown Error"
      end
    end

  end
end
