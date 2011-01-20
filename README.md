# rapleaf_api

NOTE: The Rapleaf API has changed versions and formats since this gem was created. I am going to leave it up here for reference but for production code you should look for Rapleaf's officially maintained repository [Personalization-Dev-Kits](https://github.com/Rapleaf/Personalization-Dev-Kits)

Getting Started
---------------

You need to first get an API key found here:

[http://www.rapleaf.com/developer/](http://www.rapleaf.com/developer/)
  

Installation
------------

	sudo gem install rapleaf_api

Usage
-----
	require 'rubygems'
	require 'rapleaf_api'

	rapAPI = RapleafApi::Api.new("your api key")
	
### Person API

	#by email
	person = rapAPI.query({:type => :person, :opts => {:email => "email"}})

	#by md5 hash of email
	person = rapAPI.query({:type => :person, :opts => {:hash => RapleafApi::MD5, :id => "md5 hash of email"}})

	#by site id
	person = rapAPI.query({:type => :person, :opts => {:site => RapleafApi::TWITTER, :id => "twitter username"}})

### Graph API

	#by email (note this query will only work if you have an email set stored with Rapleaf)
	friendList = rapAPI.query({:type => :graph, :opts => {:id => "email address"}})

	#by email, return Rapleaf IDs instead of scoped emails
	friendList = rapAPI.query({:type => :graph, :opts => {:id => "email address", :return_rapid => true}})

	#by Rapleaf ID, this will return a list of Rapleaf IDs
	friendList = rapAPI.query({:type => :graph, :opts => {:id => "rapleaf id", :by_rapid => true}})
	
[More Advanced Examples](http://github.com/thecoffman/rapleaf_api/blob/master/sample/api_examples.rb) :: Combine the APIs for interesting results.

Authors
-------

* [Adam Coffman](http://github.com/thecoffman) :: coffman.adam@gmail.com
* [Brent Beer](http://github.com/brntbeer) :: brentbeer@gmail.com
* [Mark Sands](http://github.com/marksands) :: marksands07@gmail.com

Special Thanks
-------
Dave Paola - Pointing out a bug in the sample code