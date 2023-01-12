require_relative "../reference_genome"

module Bio
  class TwoBit
    class PriPac1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "priPac1"
        @metadata.name = "priPac1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/priPac1/bigZips/priPac1.2bit"
        super(**kwargs)
      end
    end
  end
end
