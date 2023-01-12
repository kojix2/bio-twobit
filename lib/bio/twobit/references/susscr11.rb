require_relative "../reference_genome"

module Bio
  class TwoBit
    class SusScr11 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "susScr11"
        @metadata.name = "susScr11"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/susScr11/bigZips/susScr11.2bit"
        super(**kwargs)
      end
    end
  end
end
