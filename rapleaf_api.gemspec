Gem::Specification.new do |s|
  s.name = %q{rapleaf_api}
  s.version = "0.1.0"
  s.date = %q{2/12/10}
  s.authors = ["Adam Coffman", "Brent Beer", "Mark Sands"]
  s.email = ["coffman.adam@gmail.com", "brent.beer@gmail.com", "marksands07@gmail.com"]
  s.summary = %q{An interface to Rapleaf's person and graph APIs.}
  s.homepage = %q{http://github.com/thecoffman/rapleaf_api}
  s.description = %q{An interface to Rapleaf's person and graph APIs. Note that this library is not maintained by or affiliated with Rapleaf in any way and you will still need a (free) api key from Rapleaf to use this.}
  s.files = [ "README.md", "Manifest.txt" ,"lib/rapleaf_api.rb", "lib/api/api.rb", "lib/api/graph.rb", "lib/api/person.rb"]
  s.add_dependency(%q<xml-magic>, [">= 0"])
end
