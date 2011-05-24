Gem::Specification.new do |s|
  s.name               = "implicitly"
  s.version            = "0.0.1"
  s.authors            = ["Mike Burns"]
  s.summary            = %q{Wrap class instances implicitly}
  s.description        = %q{A port of Scala's implicits, this is an alternative to open classes that allows for easier testing.}
  s.email              = %q{mburns@thoughtbot.com}
  s.files              = ["README.rdoc", "Rakefile", "lib/implicitly.rb"]
  s.test_files         = ["test/test_implicitly.rb"]
  s.homepage           = %q{http://rubygems.org/gems/implicitly}
  s.require_paths      = ["lib"]
  s.rubygems_version   = %q{1.6.2}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to?(:required_rubygems_version=)
  s.specification_version     = 3 if s.respond_to?(:specification_version)
end

