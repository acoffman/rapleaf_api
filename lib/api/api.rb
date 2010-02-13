module RapleafApi
  class Api
    def initialize(api_key)
      @API_KEY = "?api_key=#{api_key}"
      @PERSON_URL = "http://api.rapleaf.com/v3/person/"
      @GRAPH_URL = "http://api.rapleaf.com/v2/graph/"
    end

    def query(params)
      case params[:type]
        when :person
          return Person.new(person_request(params[:opts]))
        when :graph
          return Graph.new(graph_request(params[:opts]))
        else
          raise "Invalid query type, use either :graph or :person"
      end
    end

    private

    def person_request(params)
      raise "Your params hash was formatted incorrectly!" unless url = verify_and_build_person_url(params)
      resp = Net::HTTP.get_response(URI.parse(url))
      if resp.code == 200
        return resp.body
      else
        raise_response_errors(resp.code)
      end
    end

    def graph_request(params)
      raise "Your params hash was formatted incorrectly!" unless url = verify_and_build_graph_url(params)
      resp = Net::HTTP.get_response(URI.parse(url))
      if resp.code == 200
        return resp.body
      else
        raise_response_errors(resp.code)
      end
    end

    def verify_and_build_person_url(params)
      if params.size == 1
        return false unless params[:email]
        return @PERSON_URL + "email/#{params[:email]}" + @API_KEY
      else
        return false unless params[:id] && (params[:hash] || params[:site])
        return @Person + ("hash/#{params[:hash]}/#{params[:id]}" ? params[:hash] : "web/#{params[:site]}/#{params[:id]}") + @API_KEY 
      end
    end

    def verify_graph_format(params)
    end

    def raise_response_errors(code)
      case code 
        when 202
          raise "This person is currently being searched. Please check back shortly."
        when 400
          raise "Malformed request."
        when 401
          raise "API Key invalid"
        when 403
          raise "API Key query limit exceded, please contact developer@rapleaf.com to have your limit increased."
        when 404
          raise "We do not have this person in our system. If you would like better results, consider supplying the email address."
        when 500
          raise "There was an unexpected error on our server. This should be very rare and if you see it please contact developer@rapleaf.com."
        else
          raise "Unkown Error"
      end
    end

  end
end
