# Twobit

Ruby bindings to lib2bit.

* https://github.com/deeptools/py2bit
* https://github.com/dpryan79/lib2bit

## Installation

```sh
gem install twobit
```

## Usage

```
g = Twobit.new("test/fixtures/foo.2bit")
g.sequence("chr1", 50, 100)
# => "ACGTACGTACGTagctagctGATCGATCGTAGCTAGCTAGCTAGCTGATC"
```

## Development

Bug reports and pull requests are welcome on GitHub at https://github.com/kojix2/twobit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
