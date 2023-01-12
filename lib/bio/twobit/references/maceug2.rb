require_relative "../reference_genome"

module Bio
  class TwoBit
    class MacEug2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "macEug2"
        @metadata.name = "macEug2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/macEug2/bigZips/macEug2.2bit"
        super(**kwargs)
      end
    end
  end
end
