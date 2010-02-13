require 'rubygems'
gem 'rspec'
require 'spec'

require File.dirname(__FILE__) + '/../lib/rapleaf_api'

describe RapleafApi do


  before :all do
    @api_key = "foo"
    @api = RapleafApi::Api.new( @api_key )
    
    @person_xml = File.read(File.dirname(__FILE__) + "/fixtures/person.xml")
    @graph_email_xml = File.read(File.dirname(__FILE__) + "/fixtures/graph-n1.xml")
    @graph_id_xml = File.read(File.dirname(__FILE__) + "/fixtures/graph-n2.xml")
  end
  
  describe ".new" do 
    it "should initialize RapleafApi from an api key" do
      api = RapleafApi::Api.new( @api_key )
    end
  end
    
  describe "query" do
    describe "graph" do
      describe ".friends" do

        it "should return a list of friend emails" do 
          xml = @graph_email_xml          
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @g = RapleafApi::Graph.new( xml )
          @g.friends
        end

        it "should return a list of friend ids" do
          xml = @graph_id_xml
          # param_hash = { :type => :person, :opts => { :id => "foo@bar.com", :return_rapid }}
          @api.stub!( :query ).and_return( xml )
          @g = RapleafApi::Graph.new( xml )
          @g.friends
        end

      end
    end # graph

    describe "person" do 
      describe ".occupations" do 
        it "should return a list of person occupations" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          #@p.occupations
        end
      end

      describe ".id" do 
        it "should return the person rapleaf id" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.rapleaf_id
        end
      end

    end # person
  end # query
  

end