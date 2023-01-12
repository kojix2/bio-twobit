require_relative "../reference_genome"

module Bio
  class TwoBit
    class CanFam6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "canFam6"
        @metadata.name = "canFam6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/canFam6/bigZips/canFam6.2bit"
        super(**kwargs)
      end
    end
  end
end
