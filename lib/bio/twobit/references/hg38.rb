require_relative "../reference_genome"

module Bio
  class TwoBit
    class Hg38 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "hg38"
        @metadata.name = "hg38"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.2bit"
        super(**kwargs)
      end
    end
  end
end
