require_relative "../reference_genome"

module Bio
  class TwoBit
    class DipOrd1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "dipOrd1"
        @metadata.name = "dipOrd1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/dipOrd1/bigZips/dipOrd1.2bit"
        super(**kwargs)
      end
    end
  end
end
