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

	end

end
