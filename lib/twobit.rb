# frozen_string_literal: true

require_relative "twobit/version"
require_relative "twobit/twobit"

class Twobit
  class << self
    def open(fname, masked: true)
      tb = Twobit.new(fname, masked: masked)
      yield tb
      # tb.close
    end
  end

  alias initialize_raw initialize
  alias sequence_raw sequence
  alias bases_raw bases
  alias hard_masked_blocks_raw hard_masked_blocks 

  def initialize(fname, masked: true)
    mskd = masked ? 1 : 0
    initialize_raw(fname, mskd)
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
end
