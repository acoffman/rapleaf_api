require File.dirname(__FILE__) + '/base_spec'

describe RapleafApi::Person, "person" do

  before :all do
    @person_xml = File.read(File.dirname(__FILE__) + "/fixtures/person.xml")
  end

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

  describe ".memberships(:primary)" do 
   it "should return a hash of the primary memberships" do
     xml = @person_xml
     # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
     @api.stub!( :query ).and_return( xml )
     @p = RapleafApi::Person.new( xml )
     @p.memberships(:primary).should == [{"site"=>"bebo.com", "exists"=>"false"}, {"site"=>"facebook.com", "exists"=>"false"}, {"site"=>"flickr.com", "exists"=>"false"}, {"profile_url"=>"http://profiles.friendster.com/5563", "site"=>"friendster.com", "exists"=>"true"}, {"profile_url"=>"http://www.hi5.com/friend/4927", "site"=>"hi5.com", "exists"=>"true"}, {"profile_url"=>"http://linkedin.com/profile?viewProfile=&key=31212", "site"=>"linkedin.com", "exists"=>"true"}, {"site"=>"livejournal.com", "exists"=>"false"}, {"site"=>"multiply.com", "exists"=>"false"}, {"num_friends"=>"42", "profile_url"=>"http://profile.myspace.com/index.cfm?fuseaction=user.viewprofile&friendID=26448756", "site"=>"myspace.com", "exists"=>"true"}, {"site"=>"myyearbook.com", "exists"=>"false"}, {"site"=>"plaxo.com", "exists"=>"true"}, {"site"=>"twitter.com", "exists"=>"false"}]
   end
  end

  describe ".memberships(:supplemental)" do 
   it "should return a hash of the supplemental memberships" do
     xml = @person_xml
     # param_hash = { :type => :person, :opts => { :email => "foo@bar.com", :by_rapid }}
     @api.stub!( :query ).and_return( xml )
     @p = RapleafApi::Person.new( xml )
     @p.memberships(:supplemental).should == [{"site"=>"amazon.com", "exists"=>"true"}, {"profile_url"=>"http://www.amazon.com/gp/registry/registry.html?type=wishlist&id=D5Z2DTHWZQ9Q", "site"=>"amazon.com/gp/registry/wishlist", "exists"=>"true"}, {"profile_url"=>"http://www.ecademy.com/account.php?sha=1a886d0cf", "site"=>"ecademy.com", "exists"=>"true"}, {"image_url"=>"http://images.flixster.com/profile/dummy.jpg", "profile_url"=>"http://www.flixster.com/user/dummy", "site"=>"flixster.com", "exists"=>"true"}, {"site"=>"ringo.com", "exists"=>"true"}, {"site"=>"tickle.com", "exists"=>"true"}, {"profile_url"=>"http://people.tribe.net/208cdbb3-1ac8a2886", "site"=>"tribe.com", "exists"=>"true"}, {"profile_url"=>"http://people.tribe.net/a8b373d1-208c3b960", "site"=>"tribe.com", "exists"=>"true"}, {"profile_url"=>"http://www.yelp.com/user_details?userid=DdfDOLCAA", "site"=>"yelp.com", "exists"=>"true"}]
   end
  end

end
