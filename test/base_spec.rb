require 'rubygems'
gem 'rspec'
require 'spec'

require File.dirname(__FILE__) + '/../lib/rapleaf_api'

describe RapleafApi do

  before :all do
    @api_key = "foo"
    @api = RapleafApi::Api.new( @api_key )
  end
  
  describe ".new" do 
    it "should initialize RapleafApi from an api key" do
      api = RapleafApi::Api.new( @api_key )
      api.instance_variable_get(:@API_KEY).should == "?api_key=#{@api_key}"
    end
  end

end