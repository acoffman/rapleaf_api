#This file is shows an example of a very simple way to combine the Rapleaf APIs
#We run a user through the Graph API to get a list of their friends.
#We then run their friends through Person API and aggregate the results. 
#That allows us to get some interesting aggregate stats very easily.
#This particular example gets the average age of their first degree friends
#as well as their average friend count and the number of them that have Twitter accounts
#
#We could very easily run each returned friend back through the Graph API to expand our graph 
#out by one degree before we searched the Person API. This would mean our aggregate stats would 
#cover both first and second degree friends
#
#WARNING: These techniques can burn through queries very quickly. Make sure you know what your
#query limits are.
require 'rubygems'
require 'rapleaf_api'

api = RapleafApi::Api.new('api key')

friends_info = (api.query(:type => :graph, :opts => {:return_rapid => true, :id => "email address"}).friends.map do |friend|
  begin
    api.query(:type => :person, :opts => {:site =>RapleafApi::RAPLEAF, :id => friend})
  rescue Exception => e
    puts e
    nil
  end
end).compact

age_sum = age_count = friend_sum = friend_count = twitter_count = 0

friends_info.each do |friend|
  unless friend.age.nil?
   age_sum += friend.age.to_i
   age_count += 1
  end

  unless friend.num_friends.nil?
    friend_sum += friend.num_friends.to_i
    friend_count += 1
  end

  friend.memberships(:primary).each do |site|
    twitter_count += 1 if (site["site"] == "twitter.com" && site["exists"] == "true")
  end
end

puts "Average age: #{age_sum.to_f/age_count}"
puts "Average number of followers: #{friend_sum.to_f/friend_count}"
puts "Number of friends on Twitter: #{twitter_count}"