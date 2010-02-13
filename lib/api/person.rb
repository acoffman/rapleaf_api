require 'rubygems'
require 'ruby-debug'
module RapleafApi

	class Person

		def initialize(xml)
 			@xml = XmlSimple.xml_in(xml, {'ForceArray' => false,
                                    'GroupTags' =>{'primary' => 'membership',
																			             'supplemental' => 'membership',
			                                             'occupations' =>'occupation'}})
		end

		def rapleaf_id
			@xml["id"]
		end

		def basics
			@xml["basics"]
		end

		def name
		  @xml["basics"]["name"]
		end

		def gender
			@xml["basics"]["gender"]
		end
		def location
			@xml["basics"]["location"]
		end

		def occupations
			@xml["basics"]["occupations"]
		end

		def earliest_known_activity
			@xml["basics"]["earliest_known_activity"]
		end

		def last_known_activity
			@xml["basics"]["lastest_known_activity"]
		end

		def memberships(selection = :all)
			memberships = []
			if selection == :primary || selection == :all
				memberships << (@xml["memberships"]["primary"])
			end
			if selection == :supplemental || selection == :all
				memberships << (@xml["memberships"]["supplemental"])
			end
			memberships
		end
	end

end
