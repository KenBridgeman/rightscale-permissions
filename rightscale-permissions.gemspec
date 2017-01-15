# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rightscale/permissions/version'

Gem::Specification.new do |spec|
  spec.name          = "rightscale-permissions"
  spec.version       = Rightscale::Permissions::VERSION
  spec.authors       = ["Ken Bridgeman"]
  spec.email         = ["ksg.bridgeman@gmail.com"]

  spec.summary       = %q{GET RightScale permissions for all accounts.}
  spec.description   = %q{GET RightScale account_number, account_name, user_email, and role for all (or specified) accounts and output as CSV.  Primary usage is to perform audit against all accounts. }
  spec.homepage      = "https://www.github.com/KenBridgeman/rightscale-permissions"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "right_api_client"
  spec.add_dependency "ruby-progressbar"
  spec.add_dependency "OptionParser"
end
