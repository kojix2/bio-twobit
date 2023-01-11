require_relative "../reference_genome"

module Bio
  class TwoBit
    class Mm10 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "mm10"
        @metadata.name = "mm10"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/mm10/bigZips/mm10.2bit"
        super(**kwargs)
      end
    end
  end
end
