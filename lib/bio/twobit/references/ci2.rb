require_relative "../reference_genome"

module Bio
  class TwoBit
    class Ci2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ci2"
        @metadata.name = "ci2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ci2/bigZips/ci2.2bit"
        super(**kwargs)
      end
    end
  end
end
