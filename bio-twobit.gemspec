# frozen_string_literal: true

require_relative "lib/bio/twobit/version"

Gem::Specification.new do |spec|
  spec.name          = "bio-twobit"
  spec.version       = Bio::TwoBit::VERSION
  spec.authors       = ["kojix2"]
  spec.email         = ["2xijok@gmail.com"]

  spec.summary       = "A ruby library for accessing 2bit files"
  spec.description   = "This is a Ruby binding for lib2bit(https://github.com/dpryan79/lib2bit), " \
                       "which provides high-speed access to genomic data in 2bit file format."
  spec.homepage      = "https://github.com/ruby-on-bioc/bio-twobit"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*.rb", "ext/**/*"]
  # /lib/bio/twobit/references/template.erb should be excluded.
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/bio/twobit/extconf.rb"]
end
