# frozen_string_literal: true

require_relative "twobit/version"
require_relative "twobit/twobit"

class Twobit
  class << self
    def new(fname, masked: true)
      mskd = masked ? 1 : 0
      Twobit.new_raw(fname, mskd)
    end

    def open(fname, masked: true)
      mskd = masked ? 1 : 0
      tb = Twobit.open_raw(fname, mskd)
      yield tb
      # tb.close
    end
  end
end
