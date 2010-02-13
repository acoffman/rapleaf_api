module RapleafApi
  class Api
    def initialize(api_key)
      @API_KEY = api_key
    end

    def query(params)
      case params[:type]
        when :person
          return Person.new(params[:opts])
        when :graph
          return Graph.new(params[:opts])
        else
          raise "Invalid query type, use either :graph or :person"
      end
    end



  end
end
