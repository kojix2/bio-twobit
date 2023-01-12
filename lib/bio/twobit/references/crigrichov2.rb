require_relative "../reference_genome"

module Bio
  class TwoBit
    class CriGriChoV2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "criGriChoV2"
        @metadata.name = "criGriChoV2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/criGriChoV2/bigZips/criGriChoV2.2bit"
        super(**kwargs)
      end
    end
  end
end
