require_relative "../reference_genome"

module Bio
  class TwoBit
    class UusFur1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "uusFur1"
        @metadata.name = "uusFur1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/uusFur1/bigZips/uusFur1.2bit"
        super(**kwargs)
      end
    end
  end
end
