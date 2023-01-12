require_relative "../reference_genome"

module Bio
  class TwoBit
    class Rn6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "rn6"
        @metadata.name = "rn6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/rn6/bigZips/rn6.2bit"
        super(**kwargs)
      end
    end
  end
end
