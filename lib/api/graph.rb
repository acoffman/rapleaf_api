module RapleafApi

  class Graph
    
    def initialize( body )
      @body = body
      @friends = []
    end
    
    def friends
      @body.split("\n")
    end
    
  end

end