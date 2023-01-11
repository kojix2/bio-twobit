require_relative "../reference_genome"

module Bio
  class TwoBit
    class Dm6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "dm6"
        @metadata.name = "dm6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/dm6.2bit"
        super(**kwargs)
      end
    end
  end
end
