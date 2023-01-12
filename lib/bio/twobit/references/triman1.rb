require_relative "../reference_genome"

module Bio
  class TwoBit
    class TriMan1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "triMan1"
        @metadata.name = "triMan1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/triMan1/bigZips/triMan1.2bit"
        super(**kwargs)
      end
    end
  end
end
