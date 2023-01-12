require_relative "../reference_genome"

module Bio
  class TwoBit
    class SacCer3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "sacCer3"
        @metadata.name = "sacCer3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/sacCer3/bigZips/sacCer3.2bit"
        super(**kwargs)
      end
    end
  end
end
