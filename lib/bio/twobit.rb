# frozen_string_literal: true

require "pathname"
require_relative "twobit/version"
require_relative "twobit/twobit"
require_relative "twobit/cache_path"
require_relative "twobit/downloader"
require_relative "twobit/metadata"

module Bio
  # Reader for .2bit files (i.e., from UCSC genome browser)
  class TwoBit
    attr_reader :metadata

    class << self
      def open(*args, **kwargs)
        file = new(*args, **kwargs)
        return file unless block_given?

        begin
          yield file
        ensure
          file.close
        end
        file
      end
    end

    def initialize(fname, masked: false)
      raise "TwoBit::new() does not take block; use TwoBit::open() instead" if block_given?

      fname = fname.to_path if fname.respond_to?(:to_path)
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

    # Since "end" is a reserved word in Ruby, use "stop" instead.

    def sequence(chrom, start = 0, stop = 0)
      raise ArgumentError, "negative start position" if start.negative?
      raise ArgumentError, "negative stop position" if stop.negative?

      sequence_raw(chrom, start, stop)
    end

    alias seq sequence

    def bases(chrom, start = 0, stop = 0, fraction: true)
      raise ArgumentError, "negative start position" if start.negative?
      raise ArgumentError, "negative stop position" if stop.negative?

      bases_raw(chrom, start, stop, fraction ? 1 : 0)
    end

    def hard_masked_blocks(chrom, start = 0, stop = 0)
      raise ArgumentError, "negative start position" if start.negative?
      raise ArgumentError, "negative stop position" if stop.negative?

      hard_masked_blocks_raw(chrom, start, stop)
    end

    def soft_masked_blocks(chrom, start = 0, stop = 0)
      raise ArgumentError, "negative start position" if start.negative?
      raise ArgumentError, "negative stop position" if stop.negative?

      soft_masked_blocks_raw(chrom, start, stop)
    end

    def clear_cache!
      cache_path.remove
    end

    private

    def cache_dir_path
      cache_path.base_dir
    end

    def cache_path
      @cache_path ||= CachePath.new(@metadata.id)
    end

    def download(output_path, url)
      downloader = Downloader.new(url)
      downloader.download(output_path)
    end
  end
end

Dir[__dir__ + "/twobit/references/*.rb"].each { |file| require file }
