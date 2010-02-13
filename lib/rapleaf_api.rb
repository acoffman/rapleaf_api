require 'net/http'
require 'net/http'

%w{api.rb}.each do |file|
  File.dirname(__FILE__) +"/api/" + file
end

module RapleafApi
  VERSION = '0.1.0'
end
