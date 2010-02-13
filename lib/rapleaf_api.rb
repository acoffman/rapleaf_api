require 'net/http'
require 'net/http'

%w{api.rb}.each do |file|
  File.dirname(__FILE__) +"/api/" + file
end

module RapleafApi
  VERSION = '0.1.0'

  #Constants for web queries
  BEBO = "bebo"
  FACEBOOK = "facebook"
  FLICKR = "flickr"
  FRIENDSTER = "friendster"
  HI5 = "hi5"
  LINKEDIN = "linkedin"
  MYSPACE = "myspace"
  PLAXO = "plaxo"
  RAPLEAF = "rapleaf"
  TWITTER = "twitter"
  
end
