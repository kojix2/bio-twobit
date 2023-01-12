require_relative "../reference_genome"

module Bio
  class TwoBit
    class PonAbe2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ponAbe2"
        @metadata.name = "ponAbe2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ponAbe2/bigZips/ponAbe2.2bit"
        super(**kwargs)
      end
    end
  end
end
