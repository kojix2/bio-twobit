require_relative "../reference_genome"

module Bio
  class TwoBit
    class Mm9 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "mm9"
        @metadata.name = "mm9"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/mm9/bigZips/mm9.2bit"
        super(**kwargs)
      end
    end
  end
end
