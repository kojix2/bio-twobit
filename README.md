# Twobit

[![Gem Version](https://badge.fury.io/rb/twobit.svg)](https://badge.fury.io/rb/twobit)
[![test](https://github.com/ruby-on-bioc/twobit/actions/workflows/ci.yml/badge.svg)](https://github.com/ruby-on-bioc/twobit/actions/workflows/ci.yml)

Ruby bindings to [lib2bit](https://github.com/dpryan79/lib2bit).

* https://github.com/deeptools/py2bit

## Installation

```sh
gem install twobit
```

## Usage

```ruby
g = Twobit.new("test/fixtures/foo.2bit")
g.sequence("chr1", 50, 100)
# => "ACGTACGTACGTagctagctGATCGATCGTAGCTAGCTAGCTAGCTGATC"
```

## Development

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby-on-bioc/twobit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
