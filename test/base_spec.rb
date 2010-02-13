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
      describe ".basics" do 
        it "should return a hash of the basics tag" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.basics.should == {"name"=>"Test Dummy", "location"=>"San Francisco, CA, US", "earliest_known_activity"=>"2006-02-23", "universities"=>"Berkeley", "gender"=>"Male", "num_friends"=>"42", "latest_known_activity"=>"2008-09-25", "age"=>"42", "occupations"=> [{"company"=>"Rapleaf.com", "job_title"=>"Test Dummy"}, {"job_title"=>"Comedian"}]}
        end
      end
      
      describe ".rapleaf_id" do 
        it "should return the person rapleaf id" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.rapleaf_id.should == "1d4c100000000000"
        end
      end
      
      describe ".name" do 
        it "should return the name of the person" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.name.should == "Test Dummy"
        end
      end

      describe ".age" do 
        it "should return the age of the person" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.age.should == "42"
        end
      end

      describe ".gender" do 
        it "should return the gender of the person" do
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
      
      describe ".num_friends" do 
        it "should return the number of friends a person has" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.num_friends.should == "42"
        end
      end
      
      describe ".earlist_known_activity" do 
        it "should return the earlirest known activity date" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.earliest_known_activity.should == "2006-02-23"
        end
      end
      
      describe ".last_known_activity" do 
        it "should return the last known activity date" do
          xml = @person_xml
          # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
          @api.stub!( :query ).and_return( xml )
          @p = RapleafApi::Person.new( xml )
          @p.last_known_activity.should == "2008-09-25"
        end
      end

      describe ".memberships[0]" do 
        it "should return a hash of the first membership" do
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