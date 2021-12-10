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

  def initialize(fname, masked: true)
    mskd = masked ? 1 : 0
    initialize_raw(fname, mskd)
  end

  alias hard_masked_blocks_raw hard_masked_blocks

  def hard_masked_blocks(chrom, start = 0, stop = 0)
    hard_masked_blocks_raw(chrom, start, stop)
  end
end
