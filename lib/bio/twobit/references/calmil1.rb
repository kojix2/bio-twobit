require_relative "../reference_genome"

module Bio
  class TwoBit
    class CalMil1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "calMil1"
        @metadata.name = "calMil1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/calMil1/bigZips/calMil1.2bit"
        super(**kwargs)
      end
    end
  end
end
