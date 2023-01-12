require_relative "../reference_genome"

module Bio
  class TwoBit
    class PonAbe3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ponAbe3"
        @metadata.name = "ponAbe3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ponAbe3/bigZips/ponAbe3.2bit"
        super(**kwargs)
      end
    end
  end
end
