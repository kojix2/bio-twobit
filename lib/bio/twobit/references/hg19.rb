require_relative "../reference_genome"

module Bio
  class TwoBit
    class Hg19 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "hg19"
        @metadata.name = "hg19"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit"
        super(**kwargs)
      end
    end
  end
end
