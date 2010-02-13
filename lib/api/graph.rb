module RapleafApi
  class Graph
  
    def initialize( body )
      @body = body
    end
  
    def friends
			if @body.include?(",")
				@body.split(",")
			else
      	@body.split("\n")
			end
    end

  end
end