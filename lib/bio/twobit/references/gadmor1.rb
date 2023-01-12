require_relative "../reference_genome"

module Bio
  class TwoBit
    class GadMor1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "gadMor1"
        @metadata.name = "gadMor1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/gadMor1/bigZips/gadMor1.2bit"
        super(**kwargs)
      end
    end
  end
end
