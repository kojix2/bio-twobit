require_relative "../reference_genome"

module Bio
  class TwoBit
    class Hs1 < ReferenceGenome
      def initialize
        @metadata      = Metadata.new
        @metadata.id   = "hs1"
        @metadata.name = "hs1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @local_name    = "hs1.2bit"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/hs1/bigZips/hs1.2bit"
        super
      end
    end
  end
end
