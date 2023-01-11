# Forked from https://github.com/red-data-tools/red-datasets/blob/master/lib/datasets/dataset.rb

require "pathname"

require_relative "cache_path"
require_relative "downloader"
require_relative "metadata"

module Bio
  class TwoBit
     Reference
      attr_reader :metadata

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
end
