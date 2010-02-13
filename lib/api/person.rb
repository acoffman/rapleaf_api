module RapleafApi

	class Person

		def initialize(xml)
 			@xml = XmlSimple.xml_in(xml)
		end

		def xml
			@xml
		end

		def rapleaf_id
			@xml["id"]
		end

		#def name
			#@xml.basics.name
		#end

		#def location
			#@xml.basics.location
		#end

		#def occupations
			#occupations = {}
			#for occupation in @xml.basics.occupations.occupation
				#occupations[occupation[:company]] = occupation[:job_title]
			#end
			#occupations
		#end

		#def earliest_known_activity
			#@xml.basics.earliest_known_activity
		#end

		#def last_known_activity
			#@xml.basics.lastest_known_activity
		#end

		#def memberships(selection = :all)
			#memberships = {}
			#if selection == :primary || selection == :all
				#for membership in @xml.memberships.primary.membership
					#memberships << membership[:site] unless membership[:exists] == "false"
				#end
			#end
			#if selection == :supplementary || selection == :all
				#for membership in @xml.memberships.supplemental.membership
					#memberships << membership[:site] unless membership[:exists] == "false"
				#end
			#end
			#memberships
		#end
	end


end
