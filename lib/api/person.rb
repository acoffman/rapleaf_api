module RapleafApi

	class Person

		def initialize(xml)
 			@xml = XmlSimple.xml_in(xml, {'ForceArray' => false,
                                    'GroupTags' =>{'primary' => 'membership',
																			             'supplemental' => 'membership',
																									 'universities' => 'university',
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

		def age
			@xml["basics"]["age"]
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

		def universities
			@xml["basics"]["universities"]
		end

		def earliest_known_activity
			@xml["basics"]["earliest_known_activity"]
		end

		def last_known_activity
			@xml["basics"]["latest_known_activity"]
		end

		def num_friends
			@xml["basics"]["num_friends"]
		end

		def memberships(selection = :all)
			if selection == :primary || selection == :all
				memberships = (@xml["memberships"]["primary"])
			end
			if selection == :supplemental || selection == :all
			  if memberships.nil?
			    memberships = (@xml["memberships"]["supplemental"])
		    else
				  memberships << (@xml["memberships"]["supplemental"])
			  end
			end
			memberships.compact
		end
	end

end
