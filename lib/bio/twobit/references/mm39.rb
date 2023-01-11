require_relative "../reference_genome"

module Bio
  class TwoBit
    class Mm39 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "mm39"
        @metadata.name = "mm39"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/mm39/bigZips/mm39.2bit"
        super(**kwargs)
      end
    end
  end
end
