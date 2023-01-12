require_relative "../reference_genome"

module Bio
  class TwoBit
    class CaeRem3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "caeRem3"
        @metadata.name = "caeRem3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/caeRem3/bigZips/caeRem3.2bit"
        super(**kwargs)
      end
    end
  end
end
