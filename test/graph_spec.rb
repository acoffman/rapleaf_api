require File.dirname(__FILE__) + '/base_spec'

describe RapleafApi::Graph, "graph" do

  before :all do
     @graph_email_xml = File.read(File.dirname(__FILE__) + "/fixtures/graph-n1.xml")
     @graph_id_xml = File.read(File.dirname(__FILE__) + "/fixtures/graph-n2.xml") 
  end

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

end