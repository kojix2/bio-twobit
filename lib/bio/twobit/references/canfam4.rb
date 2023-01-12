require_relative "../reference_genome"

module Bio
  class TwoBit
    class CanFam4 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "canFam4"
        @metadata.name = "canFam4"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/canFam4/bigZips/canFam4.2bit"
        super(**kwargs)
      end
    end
  end
end
