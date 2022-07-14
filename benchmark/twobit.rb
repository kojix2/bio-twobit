require "benchmark/plot"
require "bio/twobit"
require "bio-ucsc"

hg38 = File.expand_path("hg38.2bit", __dir__)

n_iters = Array.new(6) { |i| 10**(i + 1) }

Benchmark.plot(n_iters) do |x|
  x.report("bio-ucsc-api") do |i|
    Bio::Ucsc::File::Twobit.open(hg38) do |f|
      i.times { f.subseq("chr17:7,579,614-7,579,700") }
    end
  end

  x.report("bio-twobit  ") do |i|
    Bio::TwoBit.open(hg38) do |f|
      i.times { f.sequence("chr17", 7_579_613, 7_579_700) }
    end
  end
end
