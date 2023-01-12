require_relative "../reference_genome"

module Bio
  class TwoBit
    class ThaSir1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "thaSir1"
        @metadata.name = "thaSir1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/thaSir1/bigZips/thaSir1.2bit"
        super(**kwargs)
      end
    end
  end
end
