module RapleafApi

class Graph
  
  def initialize( body )
    @body = body
  end
  
  def friends
    @body.split("\n").to_a
  end

end

end