# frozen_string_literal: true

require_relative "twobit/version"
require_relative "twobit/twobit"

module Bio
  # Reader for .2bit files (i.e., from UCSC genome browser)
  class TwoBit
    def self.open(*args, **kwargs)
      file = new(*args, **kwargs)
      begin
        yield file
      ensure
        file.close
      end
      file
    end

    def initialize(fname, masked: false)
      raise "TwoBit::new() does not take block; use TwoBit::open() instead" if block_given?

      @fname = fname
      if masked
        mskd = 1
        @masked = true
      else
        mskd = 0
        @masked = false
      end
      initialize_raw(fname, mskd)
    end

    def path
      @fname
    end

    def masked?
      @masked
    end

    def sequence(chrom, start = 0, stop = 0)
      sequence_raw(chrom, start, stop)
    end

    def bases(chrom, start = 0, stop = 0, fraction: true)
      bases_raw(chrom, start, stop, fraction ? 1 : 0)
    end

    def hard_masked_blocks(chrom, start = 0, stop = 0)
      hard_masked_blocks_raw(chrom, start, stop)
    end

    def soft_masked_blocks(chrom, start = 0, stop = 0)
      soft_masked_blocks_raw(chrom, start, stop)
    end
  end
end
