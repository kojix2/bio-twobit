require_relative "../reference_genome"

module Bio
  class TwoBit
    class OryLat2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "oryLat2"
        @metadata.name = "oryLat2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/oryLat2/bigZips/oryLat2.2bit"
        super(**kwargs)
      end
    end
  end
end
