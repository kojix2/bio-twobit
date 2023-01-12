require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroPer1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droPer1"
        @metadata.name = "droPer1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droPer1/bigZips/droPer1.2bit"
        super(**kwargs)
      end
    end
  end
end
