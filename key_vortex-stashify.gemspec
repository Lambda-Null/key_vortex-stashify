# frozen_string_literal: true

require_relative "lib/key_vortex/stashify/version"

Gem::Specification.new do |spec|
  spec.name = "key_vortex-stashify"
  spec.version = KeyVortex::Stashify::VERSION
  spec.authors = ["Lambda Null"]
  spec.email = ["lambda.null.42@gmail.com"]

  spec.summary = "Stashify adapter for KeyVortex"
  spec.description = "Implements an adapter allowing any Stashify implementation to be used with KeyVortex"
  spec.homepage = "https://github.com/Lambda-Null/key_vortex-stashify"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "key-vortex", "~> 1.0.0"
  spec.add_dependency "stashify", "~> 3.2.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
