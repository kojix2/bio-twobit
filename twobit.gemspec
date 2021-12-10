# frozen_string_literal: true

require_relative "lib/twobit/version"

Gem::Specification.new do |spec|
  spec.name = "twobit"
  spec.version = Twobit::VERSION
  spec.authors = ["kojix2"]
  spec.email = ["2xijok@gmail.com"]

  spec.summary = "A ruby library for accessing 2bit files"
  spec.description = "A ruby library for accessing 2bit files"
  spec.homepage = "https://github.com/ruby-on-bioc/twobit"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/twobit/extconf.rb"]

  # spec.add_dependency "example-gem", "~> 1.0"
end
