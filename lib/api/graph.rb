require 'net/http'

class Graph
  
  def initialize( body )
    @body = body
    @friends = []
  end
  
  def friends
    @body.split("\n")
  end
  
end