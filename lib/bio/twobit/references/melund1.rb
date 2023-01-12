require_relative "../reference_genome"

module Bio
  class TwoBit
    class MelUnd1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "melUnd1"
        @metadata.name = "melUnd1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/melUnd1/bigZips/melUnd1.2bit"
        super(**kwargs)
      end
    end
  end
end
