require_relative "../reference_genome"

module Bio
  class TwoBit
    class AplCal1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "aplCal1"
        @metadata.name = "aplCal1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/aplCal1/bigZips/aplCal1.2bit"
        super(**kwargs)
      end
    end
  end
end
