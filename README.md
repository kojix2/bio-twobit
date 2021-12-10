# Twobit

[![Gem Version](https://badge.fury.io/rb/twobit.svg)](https://badge.fury.io/rb/twobit)
[![test](https://github.com/ruby-on-bioc/twobit/actions/workflows/ci.yml/badge.svg)](https://github.com/ruby-on-bioc/twobit/actions/workflows/ci.yml)

Ruby bindings to [lib2bit](https://github.com/dpryan79/lib2bit) / [py2bit](https://github.com/deeptools/py2bit).

## Installation

```sh
gem install twobit
```

## Usage

Downlaod BSgenome.Hsapiens.UCSC.hg38

```sh
wget https://bioconductor.org/packages/release/data/annotation/src/contrib/BSgenome.Hsapiens.UCSC.hg38_1.4.4.tar.gz
tar xvf BSgenome.Hsapiens.UCSC.hg38_1.4.4.tar.gz
```

```sh
irb
```

```ruby
require 'twobit'

hg38 = Twobit.new("BSgenome.Hsapiens.UCSC.hg38/inst/extdata/single_sequences.2bit")

hg38.info
# {"file_size"=>818064875,
# "nChroms"=>640,
# "sequence_length"=>3272116950,
# "hard_masked_length"=>161368694,
# "soft_masked_length"=>0}

hg38.chroms.take(5)
# [["chr1", 248956422],
# ["chr2", 242193529],
# ["chr3", 198295559],
# ["chr4", 190214555],
# ["chr5", 181538259]]

hg38.sequence("chr1", 10000, 10100)
# "TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAAC"

hg38.bases("chr1", 10000, 10100)
# {"A"=>0.34, "C"=>0.49, "T"=>0.17, "G"=>0.0}

hg38.bases("chr1", 10000, 10100, fraction: false)
# {"A"=>34, "C"=>49, "T"=>17, "G"=>0}

hg38.bases("chr1") 
# {"A"=>0.26940569141052323,
# "C"=>0.19302592242428676,
# "T"=>0.2701041550155312,
# "G"=>0.19325280952182064}

hg38.hard_masked_blocks("chr1", 0, 1000000)
# [[0, 10000], [207666, 257666], [297968, 347968], [535988, 585988]]
```


## Development

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby-on-bioc/twobit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
