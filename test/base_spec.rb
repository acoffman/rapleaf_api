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
      api.instance_variable_get(:@API_KEY).should == "?api_key=#{@api_key}"
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
          @g.friends[0].should == "dummy-friend-alpha@rapleaf.com"
        end

        it "should return a list of friend ids" do
          xml = @graph_id_xml
          # param_hash = { :type => :person, :opts => { :id => "foo@bar.com", :return_rapid }}
          @api.stub!( :query ).and_return( xml )
          @g = RapleafApi::Graph.new( xml )
          @g.friends[0].should == "00e1e692420913e3"
        end

      end
    end # graph

    describe "person" do 
      describe ".id" do 
        it "should return the person rapleaf id" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.rapleaf_id.should == "1d4c100000000000"
        end
      end
      
      describe ".name" do 
        it "should return a list of person occupations" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.name.should == "Test Dummy"
        end
      end

      describe ".gender" do 
        it "should return a list of person occupations" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.gender.should == "Male"
        end
      end

      describe ".occupations" do 
        it "should return a list of person occupations" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.occupations.should == [{"company"=>"Rapleaf.com", "job_title"=>"Test Dummy"}, {"job_title"=>"Comedian"}]
        end
      end

      describe ".memberships" do 
        it "should return a list of person occupations" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.memberships[0].should == { "site" => "bebo.com", "exists" => "false" }
        end
      end

    end # person
  end # query
  

end