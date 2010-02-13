module RapleafApi
  class Api
    def initialize(api_key)
      @API_KEY = api_key
    end

    def query(params)
      case params[:type]
        when :person
          return Person.new(request(params[:opts]))
        when :graph
          return Graph.new(request(params[:opts]))
        else
          raise "Invalid query type, use either :graph or :person"
      end
    end

    def request(params)
      #perform the web hit here, return the web response
      #throw exceptions for 202, 400, 403, 500, 404
    end

  end
end
