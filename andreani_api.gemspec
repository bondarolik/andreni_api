lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "andreani_api/version"

Gem::Specification.new do |spec|
  spec.name          = "andreani_api"
  spec.version       = AndreaniApi::VERSION
  spec.authors       = ["V.Bondaruk | RubyDroids.com"]
  spec.email         = ["vbondaruk@rubydroids.com"]

  spec.summary       = %q{Ruby Gem for Andreani API Interface}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/bondarolik/andreni_api.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/andreani_api'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake"
  spec.add_dependency "rest-client"
  spec.add_dependency "json"
end
