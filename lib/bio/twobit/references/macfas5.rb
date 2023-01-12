require_relative "../reference_genome"

module Bio
  class TwoBit
    class MacFas5 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "macFas5"
        @metadata.name = "macFas5"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/macFas5/bigZips/macFas5.2bit"
        super(**kwargs)
      end
    end
  end
end
