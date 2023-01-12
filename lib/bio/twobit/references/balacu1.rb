require_relative "../reference_genome"

module Bio
  class TwoBit
    class BalAcu1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "balAcu1"
        @metadata.name = "balAcu1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/balAcu1/bigZips/balAcu1.2bit"
        super(**kwargs)
      end
    end
  end
end
