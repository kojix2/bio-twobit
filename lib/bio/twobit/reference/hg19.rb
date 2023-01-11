module Bio
  class TwoBit
    class Hg19 < TwoBit
      def self.open
      end

      def initialize
        @metadata      = Metadata.new
        @metadata.id   = "hg19"
        @metadata.name = "hg19"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        super(prepare_data)
      end

      private

      def prepare_data
        data_path = cache_dir_path + "hg19.2bit"
        data_url = "https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit"
        download(data_path, data_url)
        data_path
      end
    end
  end
end
