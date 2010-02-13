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
	
	#to get a person back from the person api by email
	person = rapAPI.query({:type => :person, {:email => "email"}})

	#by md5 hash of email
	person = rapAPI.query({:type => :person, {:hash => RapleafApi::MD5, :id => "md5 hash of email"}})

	#by site id
	person = rapAPI.query({:type => :person, {:site => RapleafApi::TWITTER, :id => "twitter username"}})
	
Author
------

* Adam Coffman :: coffman.adam@gmail.com
* Brent Beer :: brentbeer@gmail.com
* Mark Sands :: marksands07@gmail.com