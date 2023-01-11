# bio-twobit

[![Gem Version](https://badge.fury.io/rb/bio-twobit.svg)](https://badge.fury.io/rb/bio-twobit)
[![test](https://github.com/ruby-on-bioc/bio-twobit/actions/workflows/ci.yml/badge.svg)](https://github.com/ruby-on-bioc/bio-twobit/actions/workflows/ci.yml)
[![dics](https://img.shields.io/badge/docs-stable-blue.svg)](https://rubydoc.info/gems/bio-twobit)
[![DOI](https://zenodo.org/badge/436454379.svg)](https://zenodo.org/badge/latestdoi/436454379)

Ruby bindings to [lib2bit](https://github.com/dpryan79/lib2bit) / [py2bit](https://github.com/deeptools/py2bit).

## Installation

```sh
gem install bio-twobit
```

Linux and macOS are supported.
Windows is currently not supported.

## Usage

Downlaod BSgenome.Hsapiens.UCSC.hg38

```sh
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.2bit
```

### Quick Start

```ruby
require 'bio/twobit'

hg38 = Bio::TwoBit.open("hg38.2bit")

hg38.path
# "hg38.2bit"

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
```

Fetch a sequence

```ruby
hg38.sequence("chr1", 50000, 50050)
# "AAACAGGTTAATCGCCACGACATAGTAGTATTTAGAGTTACTAGTAAGCC" # length 50
```

* The first number is the **(0-based)** position on the chromosome/contig where the sequence should begin. 
* The second number is the **(1-based)** position on the chromosome where the sequence should end.

```ruby
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

The 2-bit file must be closed explicitly. Alternatively, you can use a block. Even if it is not closed, it will probably be closed by GC and there will be no problem. But this is not guaranteed.

```ruby
# Explicitly close the file.
tb = Bio::TwoBit.open("test/fixtures/foo.2bit")
tb.close

# You can also use blocks.
Bio::TwoBit.open("test/fixtures/foo.2bit") do |t|
  p t.info
end
```

```ruby
tb.closed? # true / false
```

If you would like to include information about soft-masked bases, you need to specify `masked: true`

```ruby
tb = Bio::TwoBit.open("test/fixtures/foo.2bit")
tb.sequence("chr1", 60, 72)
# => "GTAGCTAGCTGA"

tb = Bio::TwoBit.open("test/fixtures/foo.2bit", masked: true)
tb.sequence("chr1", 60, 72)
# => "GTagctagctGA"
tb.soft_masked_blocks("chr1")
# => [[62, 70]]
```

```ruby
tb.masked? # true / false
```

## hg19, hg38, hs1...

Some reference genomes are provided as classes in advance. These classes automatically download 2bit files from the UCSC site into a cache directory upon first use.

```ruby
hg19 = Bio::TwoBit::Hg19.new
hg38 = Bio::TwoBit::Hg38.new
hs1  = Bio::TwoBit::Hs1.new
```

Adding a new reference genome is easy. Add [here](https://github.com/ruby-on-bioc/bio-twobit/blob/main/lib/bio/twobit/references/template.erb) the id of the genome you want to use. 

```
git clone https://github.com/ruby-on-bioc/bio-twobit
vi lib/bio/twobit/references/template.erb # Add your id to ids list.
ruby lib/bio/twobit/references/template.erb
rake install
```

If you want to use 2-bit files from locations other than UCSC, create your own classes [here](https://github.com/ruby-on-bioc/bio-twobit/tree/main/lib/bio/twobit/references).

Pull requests are welcome.

## Development

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby-on-bioc/bio-twobit.

    Do you need commit rights to my repository?
    Do you want to get admin rights and take over the project?
    If so, please feel free to contact us @kojix2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Code from [Red Datasets](https://github.com/red-data-tools/red-datasets) is used for automatic file download and caching. (The MIT license)

