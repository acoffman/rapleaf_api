require 'rubygems'
require 'net/http'
require 'xmlsimple'

%w{api.rb person.rb graph.rb errors.rb}.each do |file|
  require File.dirname(__FILE__) +"/api/" + file
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

  #constants for hash types
  MD5 = "md5"
  SHA1 = "sha1"

end
