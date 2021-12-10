# frozen_string_literal: true

require_relative "twobit/version"
require_relative "twobit/twobit"

class Twobit
  class << self
    def open(fname, masked: true)
      mskd = masked ? 1 : 0
      tb = Twobit.new(fname, mskd)
      yield tb
      # tb.close
    end
  end

  alias initialize_raw initialize

  def initialize(fname, masked: true)
    mskd = masked ? 1 : 0
    initialize_raw(fname, mskd)
  end
end
