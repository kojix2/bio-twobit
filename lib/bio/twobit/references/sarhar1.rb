require_relative "../reference_genome"

module Bio
  class TwoBit
    class SarHar1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "sarHar1"
        @metadata.name = "sarHar1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/sarHar1/bigZips/sarHar1.2bit"
        super(**kwargs)
      end
    end
  end
end
