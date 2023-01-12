require_relative "../reference_genome"

module Bio
  class TwoBit
    class Dp3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "dp3"
        @metadata.name = "dp3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/dp3/bigZips/dp3.2bit"
        super(**kwargs)
      end
    end
  end
end
