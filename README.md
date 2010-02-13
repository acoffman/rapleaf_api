rapleaf_api
===========

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
	
	##### PERSON API #####

	#by email
	person = rapAPI.query({:type => :person, {:email => "email"}})

	#by md5 hash of email
	person = rapAPI.query({:type => :person, {:hash => RapleafApi::MD5, :id => "md5 hash of email"}})

	#by site id
	person = rapAPI.query({:type => :person, {:site => RapleafApi::TWITTER, :id => "twitter username"}})

	##### GRAPH API #####

	#by email (note this query will only work if you have an email set stored with Rapleaf)
	friendList = rapAPI.query({:type => :graph, {:id => "email address"}})

	#by email, return Rapleaf IDs instead of scoped emails
	friendList = rapAPI.query({:type => :graph, {:id => "email address", :return_rapid => true}})

	#by Rapleaf ID, this will return a list of Rapleaf IDs
	friendList = rapAPI.query({:type => :graph, {:id => "rapleaf id", :by_rapid => true}})
	
Author
------

* Adam Coffman :: coffman.adam@gmail.com
* Brent Beer :: brentbeer@gmail.com
* Mark Sands :: marksands07@gmail.com