require_relative "../reference_genome"

module Bio
  class TwoBit
    class ManPen1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "manPen1"
        @metadata.name = "manPen1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/manPen1/bigZips/manPen1.2bit"
        super(**kwargs)
      end
    end
  end
end
