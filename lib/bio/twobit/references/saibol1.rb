require_relative "../reference_genome"

module Bio
  class TwoBit
    class SaiBol1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "saiBol1"
        @metadata.name = "saiBol1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/saiBol1/bigZips/saiBol1.2bit"
        super(**kwargs)
      end
    end
  end
end
