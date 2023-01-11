require_relative "../reference_genome"

module Bio
  class TwoBit
    class DanRer10 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "danRer10"
        @metadata.name = "danRer10"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/danRer10/bigZips/danRer10.2bit"
        super(**kwargs)
      end
    end
  end
end
