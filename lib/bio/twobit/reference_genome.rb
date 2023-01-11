module Bio
  class TwoBit
    class ReferenceGenome < TwoBit
      def self.open(*args, **kwargs, &block)
        raise ArgumentError, "#{self}#open() does not accept arguments" if args.any?

        super(**kwargs, &block)
      end

      def initialize(**kwargs)
        super(prepare_data, **kwargs)
      end

      private

      def prepare_data
        data_path = cache_dir_path + @local_name
        download(data_path, @data_url)
        data_path
      end
    end
  end
end
