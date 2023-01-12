require_relative "../reference_genome"

module Bio
  class TwoBit
    class CaePb2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "caePb2"
        @metadata.name = "caePb2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/caePb2/bigZips/caePb2.2bit"
        super(**kwargs)
      end
    end
  end
end
