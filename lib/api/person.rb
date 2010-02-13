require 'ruby-debug'

xml = <<XML
<person id="43e345d500000000">
  <basics>
    <name>Brent Beer</name>
    <gender>Male</gender>
    <location>Saint Louis, SC</location>
    <occupations>
      <occupation job_title="Student" company="Southern Illinois University, Edwardsville"/>
    </occupations>
    <earliest_known_activity>2008-04-28</earliest_known_activity>
    <latest_known_activity>2010-01-03</latest_known_activity>
    <num_friends>6</num_friends>
  </basics>
  <memberships>
    <primary>
      <membership site="bebo.com" exists="false"/>
      <membership site="facebook.com" exists="true"/>
      <membership site="flickr.com" exists="false"/>
      <membership site="friendster.com" exists="false"/>
      <membership site="hi5.com" exists="false"/>
      <membership site="linkedin.com" exists="true" profile_url="http://www.linkedin.com/pub/brent-beer/8/295/894" num_friends="6" num_followers="0"/>
      <membership site="livejournal.com" exists="false"/>
      <membership site="metroflog.com" exists="false"/>
      <membership site="multiply.com" exists="false"/>
      <membership site="myspace.com" exists="false"/>
      <membership site="myyearbook.com" exists="false"/>
      <membership site="plaxo.com" exists="false"/>
      <membership site="twitter.com" exists="true" profile_url="http://twitter.com/brntbeer" image_url="http://a1.twimg.com/profile_images/533184650/beerbeers.jpg" num_followers="475"/>
    </primary>
    <supplemental>
      <membership site="amazon.com" exists="true"/>
      <membership site="wordpress.com" exists="true"/>
    </supplemental>
  </memberships>
</person>
XML
module RapleafApi

	class Person

		def initialize(xml)
			@xml = CommonThread::XML::XmlMagic.new(xml)
		end

		def rapleaf_id
			debugger
			@xml[:id]
		end

		def basics
			@xml.basics
		end

		def memberships(selection = :all)
			memberships = {}
			if selection == :primary || selection == :all
				for membership in @xml.memberships.primary.membership
					 memberships << membership[:site] unless membership[:exists] == "false"
				end
			end
			if selection == :supplementary || selection == :all
				for membership in @xml.memberships.supplemental.membership
					memberships << membership[:site] unless membership[:exists] == "false"
				end
			end
			memberships
		end
	end

end

