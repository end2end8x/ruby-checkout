
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "checkout"
  spec.version       = "1.0.0"
  spec.authors       = ["Tran Danh Tuan"]
  spec.email         = ["end2end8x@gmail.com"]

  spec.summary       = %q{Checkout price with multiple rules.}
  spec.description   = %q{Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.}
  spec.homepage      = "https://github.com/end2end8x/ruby-checkout"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/end2end8x/ruby-checkout"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/end2end8x/ruby-checkout"
    spec.metadata["changelog_uri"] = "https://github.com/end2end8x/ruby-checkout/blob/master/CODE_OF_CONDUCT.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "rake", "~> 12.3.2"
  spec.add_development_dependency "rspec", "~> 3.8"
end
