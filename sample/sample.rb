require 'rubygems'
require 'rapleaf_api'

api = RapleafApi::Api.new('xxxxxxxxxxxxxxxxxxxxx')
person = api.query( :type => :person, :opts => { :site => RapleafApi::TWITTER, :id => 'thecoffman' })
list = api.query(:type => :graph, :opts => {:id => "coffman.adam@gmail.com" , :return_rapid => true})

##MORE METHODS THAN THIS ARE AVAILABLE, THIS IS JUST A SAMPLE
puts person.rapleaf_id
puts person.name
puts person.basics
puts person.occupations
puts person.age
puts person.location

puts person.memberships
puts person.memberships(:primary)
puts person.memberships(:supplemental)

puts list.friends

